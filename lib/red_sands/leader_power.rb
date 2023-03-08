# typed: false
# frozen_string_literal: true

module RedSands
  # Leaders have abilities that can be triggered using a specific card
  class LeaderPower < BaseModel
    attr_reader :description, :effect, :cost, :precondition

    def initialize(description:, effect:, cost: {}, precondition: nil)
      @description = description
      @precondition = precondition
      @cost = cost
      @effect = effect
    end

    def trigger
      broadcast(Events::LeaderPower.new(precondition:, effect:, cost:))
    end
  end
end
