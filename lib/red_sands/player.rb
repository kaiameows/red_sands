# frozen_string_literal: true

module RedSands
  # Encapsulates State and Behavior of a Player
  class Player
    include Ma.subscriber
    attr_reader :name, :score, :hand, :resources, :deck, :avatars, :secret_powers, :alliances, :troops

    # rubocop:disable Metrics/ParameterLists
    def initialize(name,
                   score: 0,
                   hand: [],
                   resources: default_resources,
                   deck: default_deck,
                   avatars: 2,
                   secret_powers: [],
                   alliances: [],
                   troops: default_troops)
      @name = name
      @score = score
      @hand = hand
      @resources = resources
      @deck = deck
      @avatars = avatars
      @secret_powers = secret_powers
      @alliances = alliances
      @troops = troops
    end
    # rubocop:enable Metrics/ParameterLists

    def default_resources
      { gems: 0, money: 0, food: 2 }.tap { |r| r.default = 0 }
    end

    def default_deck
      []
    end

    def default_troops
      { reserve: [Troop[:normal], Troop[:normal]], active: [] }
    end

    def active_troops
      troops[:active]
    end

    def reserve_troops
      troops[:reserve]
    end

    def choose_leader(leader)
      # should only be called once
      @leader = leader
      instance_eval(&leader.passive_power)
    end

    def add_resources(resources)
      @resources.merge!(resources) { |_, old, new| old + new }
    end

    def remove_resources(resources)
      @resources.merge!(resources) { |_, old, new| old - new }
    end
  end
end
