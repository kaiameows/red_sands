# typed: true
# frozen_string_literal: true

module RedSands
  module Actions
    # BaseAction is the base class for all actions
    class BaseAction
      attr_reader :description, :cost, :precondition, :effect

      def initialize(description:, effect:, cost: {}, precondition: nil)
        @description = description
        @precondition = precondition
        @cost = cost
        @effect = effect
      end

      alias to_s description
    end
  end
end
