# typed: true
# frozen_string_literal: true

require 'forwardable'

module RedSands
  # Encapsulates State and Behavior of a Player
  class Player < BaseModel
    extend T::Sig
    extend Forwardable

    sig { returns(String) }
    attr_reader :name

    sig { returns(Resources) }
    attr_reader :resources

    sig { returns(BaseDeck) }
    attr_reader :deck

    sig { returns(Barracks) }
    attr_reader :barracks

    sig { returns(Integer) }
    attr_reader :workers

    sig { returns(T::Array[Cards::SecretPowerCard]) }
    attr_reader :secret_powers

    sig { returns(T.nilable(Leader)) }
    attr_reader :leader

    sig { returns(DiplomaticProgress) }
    attr_reader :diplomatic_progress

    def_delegators :@resources, :gems, :money, :food, :score
    def_delegators :@diplomatic_progress, :alliances
    def_delegators :@barracks, :active_troops, :reserve_troops
    def_delegators :@deck, :hand, :discard_pile, :draw_pile, :exiled_pile

    sig do
      params(
        name: String,
        resources: Resources,
        deck: BaseDeck,
        workers: Integer,
        secret_powers: T::Array[Cards::SecretPowerCard],
        barracks: Barracks,
        leader: T.nilable(Leader),
        diplomatic_progress: DiplomaticProgress
      ).void
    end
    # rubocop:disable Metrics/ParameterLists
    def initialize(name,
                   resources: default_resources,
                   deck: default_deck,
                   workers: 2,
                   secret_powers: [],
                   barracks: Barracks.new,
                   leader: nil,
                   diplomatic_progress: DiplomaticProgress.new)
      @name = name
      @leader = leader
      @resources = resources
      @deck = deck
      @workers = workers
      @secret_powers = secret_powers
      @barracks = barracks
      @diplomatic_progress = diplomatic_progress
    end
    # rubocop:enable Metrics/ParameterLists

    sig { returns(Resources) }
    def default_resources
      Resources.new
    end

    sig { returns(BaseDeck) }
    def default_deck = BaseDeck.new

    def inspect
      "#<#{self.class.name} #{name}>"
    end
  end
end
