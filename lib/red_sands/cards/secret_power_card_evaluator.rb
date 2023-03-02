# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # provides the DSL for defining secret power cards
    class SecretPowerCardEvaluator < RedSands::Rules::RuleFactory
      extend T::Sig

      sig { returns(T::Array[SecretPowerCard]) }
      def cards
        @cards ||= T.let(nil, T.nilable(T::Array[SecretPowerCard]))
        @cards ||= []
      end

      sig do
        params(
          name: String,
          block: T.proc.returns(T.untyped)
        ).returns(
          T::Array[SecretPowerCard]
        )
      end
      def card(name, &block)
        cards << build(evaluator.tap do |ev|
          ev.name name
          ev.instance_eval(&block)
        end)
      end

      sig { params(evaluator: RedSands::Rules::RuleFactory).returns(SecretPowerCard) }
      def build(evaluator)
        SecretPowerCard.new(**evaluator.attributes.slice(:name, :allowed_phases, :effect))
      end

      sig { returns(RedSands::Rules::RuleFactory) }
      def evaluator
        RedSands::Rules::RuleFactory.new
      end
    end
  end
end
