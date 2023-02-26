# typed: true
# frozen_string_literal: true

module RedSands
  module Rules
    # SectorEvaluator provides a DSL for creating sectors
    class SectorEvaluator < RuleFactory
      def locations = @locations ||= []

      def location(name, &)
        locations << LocationEvaluator.new(attributes[:name]).tap do |evaluator|
          evaluator.name name
          evaluator.instance_eval(&)
        end.build
      end

      def build
        RedSands::Sector.new(name: attributes[:name], locations:).tap do |sector|
          boolean_attributes.each { |k, v| sector.add_flag(k, v) }
        end
      end
    end
  end
end
