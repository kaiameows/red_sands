# typed: strict
# frozen_string_literal: true

module RedSands
  # Locations are the places where players can collect resources
  class Location < BaseModel
    extend T::Sig
    include Concerns::Flaggable

    sig { returns(String) }
    attr_reader :name

    sig { returns(T.nilable(Effect)) }
    attr_reader :resources

    sig { returns(T.nilable(Effect)) }
    attr_reader :effect

    sig { returns(Sector) }
    attr_reader :sector

    sig { returns(T.nilable(Resources)) }
    attr_reader :cost

    sig do
      params(
        name: String,
        sector: Sector,
        cost: T.nilable(Resources),
        resources: T.nilable(Effect),
        effect: T.nilable(Effect)
      ).void
    end
    def initialize(name:, sector:, cost: Resources.none, resources: nil, effect: nil)
      @name = name
      @resources = resources
      @cost = cost
      # effect should be a GameEffect with a description, cost, precondition, and effect
      @effect = effect
      @sector = sector
    end
  end
end
