# typed: strict
# frozen_string_literal: true

module RedSands
  module Rules
    # LocationEvaluator provides a DSL for creating locations
    class LocationEvaluator < RuleFactory
      extend T::Sig

      LocationArray = T.type_alias { T::Array[Location] }

      sig { returns(LocationArray) }
      def locations
        @locations ||= T.let(nil, T.nilable(LocationArray))
        @locations ||= []
      end

      sig { params(sector: Sector).void }
      def initialize(sector:)
        super()
        attributes[:sector] = sector
      end

      sig { params(name: String, blk: T.proc.void).returns(LocationArray) }
      def location(name, &blk)
        locations << dup.tap do |evaluator|
          evaluator.name name
          evaluator.instance_eval(&blk)
        end.build
      end

      sig { params(resources: T::Hash[Symbol, Integer]).returns(Effect) }
      def resources(resources)
        attributes[:resources] = EffectEvaluator.new.gain(**resources)
      end

      sig { params(cost: Integer).returns(Resources) }
      def cost(**cost)
        attributes[:cost] = Resources.new(**cost)
      end

      sig do
        params(
          description: String,
          block: T.proc.returns(T.untyped)
        ).returns(Effect)
      end
      def effect(description, &block)
        attributes[:effect] = EffectEvaluator.new.effect(description, &block)
      end

      sig { returns(Location) }
      def build
        Location.new(**attributes.slice(:name, :resources, :cost, :effect, :sector)).tap do |loc|
          boolean_attributes.each { |k, v| loc.add_flag(k, v) }
        end
      end
    end
  end
end
