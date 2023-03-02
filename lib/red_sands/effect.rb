# typed: strict
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
