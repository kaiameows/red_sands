# typed: strict
# frozen_string_literal: true

module RedSands
  module Actions
    # BaseAction is the base class for all actions
    # this is like a thing that can be done in the game
    # effects should be evaluated in a context that has access to the game state
    # and pass any relevant bits to broadcast
    # this almost certainly means EffectEvaluator
    class BaseAction
      extend T::Sig

      sig { returns(String) }
      attr_reader :description

      sig { returns(Resources) }
      attr_reader :cost

      sig { returns(T.nilable(T.proc.returns(T::Boolean))) }
      attr_reader :precondition

      sig { returns(T.proc.void) }
      attr_reader :effect

      sig do
        params(
          description: String,
          effect: T.proc.void,
          cost: Resources,
          precondition: T.nilable(T.proc.returns(T::Boolean))
        ).void
      end
      def initialize(description:, effect:, cost: Resources.new, precondition: nil)
        @description = description
        @precondition = precondition
        @cost = cost
        @effect = effect
      end

      alias to_s description
    end
  end
end
