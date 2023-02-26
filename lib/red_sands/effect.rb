# typed: true
# frozen_string_literal: true

module RedSands
  # event is a parsed card or location effect
  # effects I guess should have some context for where they're declared, maybe?
  # that would probably involve building that into the RuleFactory class
  # they need to have a description, a cost, a precondition, and an effect
  # the preconditions and effects should probably be reducers, i.e. they should be functions that take a game state and return a game state
  # the cost should be a hash of resources to numbers
  # the description should be a string
  class Effect < BaseModel
    attr_reader :description, :effect, :cost, :preconditions

    def initialize(description:, effect:, cost: {}, preconditions: [])
      @description = description
      @effect = effect
      @cost = cost
      @preconditions = preconditions
    end

    def to_s
      description
    end
  end
end
