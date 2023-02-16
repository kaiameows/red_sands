# frozen_string_literal: true

module RedSands
  # Leaders have abilities that can be triggered using a specific card
  class LeaderPower
    attr_reader :description, :effect, :cost, :precondition

    def initialize(description:, effect:, cost: {}, precondition: nil)
      @description = description
      @precondition = precondition
      @cost = cost
      @effect = effect
    end
  end
end
