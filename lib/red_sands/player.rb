# frozen_string_literal: true

module RedSands
  # Encapsulates State and Behavior of a Player
  class Player
    include Ma::Publisher
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
      # instance eval or class eval?
      # I kinda feel like it should be class eval
      instance_eval(&leader.passive_power)
    end

    def add_resources(raw_resources)
      resources.merge!(raw_resources.slice(:gems, :money, :food)) { |_, old, new| old + new }
      broadcast TroopsAdded.new(player: self, troops: raw_resources[:troops]) if raw_resources.key?(:troops)
      draw raw_resources[:secret_powers], from: :secret_powers if raw_resources.key?(:secret_powers)
    end

    def remove_resources(resources)
      @resources.merge!(resources) { |_, old, new| old - new }
    end

    def draw(count, from:)
      count.times { hand << game_state.decks[from].pop }
    end
  end
end
