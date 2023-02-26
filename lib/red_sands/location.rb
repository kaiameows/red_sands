# typed: true
# frozen_string_literal: true

module RedSands
  # Locations are the places where players can collect resources
  class Location < BaseModel
    include RedSands::Concerns::Flaggable
    attr_reader :name, :resources, :agents, :effect, :sector_name, :cost

    def initialize(name:, sector_name:, cost: {}, resources: {}, effect: nil, agents: [])
      @name = name
      @resources = resources
      @cost = cost
      # effect should be a GameEffect with a description, cost, precondition, and effect
      @effect = effect
      @agents = agents
      @sector_name = sector_name
    end

    def occupied? = agents.any?

    def sector = @sector ||= RedSands::GameState.current.board.sectors[sector_name]
  end
end
