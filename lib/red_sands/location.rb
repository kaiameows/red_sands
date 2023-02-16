# frozen_string_literal: true

module RedSands
  # Locations are the places where players can collect resources
  class Location
    include RedSands::Concerns::Flaggable
    attr_reader :name, :resources, :cost, :agents, :effect

    # rubocop:disable Metrics/ParameterLists
    def initialize(name:, resources: {}, cost: {}, effect: nil, agents: [], requirement: nil)
      @name = name
      @resources = resources
      @cost = cost
      # effect should be a proc, and it should be evaluated in the context of the game_state object
      # this is so it can access things like the current player and opponents and such
      @effect = effect
      @agents = agents
      @requirement = requirement
    end
    # rubocop:enable Metrics/ParameterLists

    def occupied? = agents.any?
  end
end
