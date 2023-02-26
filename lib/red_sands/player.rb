# typed: false
# frozen_string_literal: true

require 'forwardable'
require 'ostruct'

module RedSands
  # Encapsulates State and Behavior of a Player
  class Player < BaseModel
    extend Forwardable
    include Ma.subscriber
    attr_reader :name, :resources, :deck, :workers, :secret_powers, :leader

    def_delegators :@resources, :gems, :money, :food, :score
    def_delegators :@diplomatic_progress, :alliances, :progress
    def_delegators :@barracks, :active_troops, :reserve_troops

    def initialize(name,
                   resources: default_resources,
                   deck: default_deck,
                   workers: 2,
                   secret_powers: [])
      @name = name
      @leader = nil
      @resources = resources
      @deck = deck
      @workers = workers
      @secret_powers = secret_powers
    end

    def default_resources
      RedSands::Resources.new
    end

    def default_deck = RedSands::Cards::StarterCards

    def choose_leader!(leader)
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

    def draw(count)
      # this should probably only let the player draw from their own deck
      # drawing from other decks should probably be handled by those objects
      hand << deck.draw(count)
    end

    def take_action
      # give the player a choice of actions
      # actions will vary depending on the current phase and what actions the player has already taken
    end
  end
end
