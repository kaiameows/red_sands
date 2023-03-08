# typed: false
# frozen_string_literal: true

require 'forwardable'

module RedSands
  # GameState encapsulates the state of the game
  # rubocop:disable Metrics/ClassLength
  class GameState < BaseModel
    extend T::Sig
    extend Forwardable
    TournamentDeck = T.type_alias { T::Array[Cards::TournamentCard] }

    class << self
      def push(state) = states.push(state)
      def clear = states.clear
      def states = @states ||= []
      def current = states.last
      def rewind(count = 1) = count.times { states.pop }
      def new(**kwargs) = super(**kwargs).tap { |state| push(state) }
    end

    def_delegators :@ruleset, :board, :decks

    # Red Sands is a turn-based game
    # Each turn consists of the following phases:
    # 1. Draw Phase
    #  - each player draws 5 cards
    #  - the next tournament card is drawn
    # 2. Action Phase
    #  - starting with the first player, each player takes actions in turn, until they cannot take further actions
    #  - Players can take the following actions:
    #    - use a card from their hand to move an worker to a location which matches the sector labels of the card
    #    - reveal cards from their hand, gaining power with which to acquire buyable cards. Cards have a power value and may have additional effects on reveal
    #    - once a player has taken a reveal action, they may take a buy action, which allows them to buy a card from the market
    #    - once a player has taken a reveal action, they may not take any further actions until the next phase
    #    - treasure cards can be played any time the player is able to take an action
    #    - treasure cards may not be played during an opponent's action
    # 3. Tournament Phase
    #   - Players during the action phase may move troops to the tournament location
    #   - A player's total combat power is based on the number of troops they have in the tournament
    #   - Combat power can be increased by other card effects, but card effects do not provide any combat bonus unless the player has troops in the tournament
    #   - Before combat is resolved, each player may take it in turn to play a tournament-category treasure card
    #   - Combat is resolved by comparing the total combat power of each player
    #   - The player with the highest combat power wins the tournament and the first-place prize is awarded
    #     The second-highest combat power wins the second-place prize
    #   - If there are four players, the player with the third-highest combat power wins the third-place prize
    #   - If there is a tie, no one wins, and the tied players both receive the second-place prize
    #   - After the tournament is resolved, all non-indestructible troops are destroyed
    #   - Some treasure cards can be played after a tournament is won
    # 4. Resolution Phase
    #   - add gems to all gem accumulator locations
    #   - If the tournament deck is empty, or if a player has a score of 10 or more, the Endgame phase is triggered
    #   - Otherwise, the next turn begins
    state_machine :phase, initial: :setup do
      around_transition do |game, transition, block|
        # fires the before and after events
        game.with_hooks(transition.event, &block)
      end
      event :start do
        transition setup: :draw
      end

      event :action_phase do
        transition draw: :action
      end

      event :buy_phase do
        transition action: :buy, if: :action_phase_over?
      end

      # if no player has any active troops, the tournament phase is skipped
      event :tournament_phase do
        transition buy: :tournament, if: :buy_phase_over?, unless: :no_active_troops?
        transition buy: :resolution, if: :buy_phase_over?
      end

      event :resolution_phase do
        transition tournament: :resolution, if: :tournament_phase_over?
      end

      event :end_turn do
        transition resolution: :end_game, if: :endgame_condition_met?
        transition resolution: :draw
      end
    end

    attr_reader :players
    attr_accessor :ruleset, :market, :tournament_deck

    sig do
      params(
        players: T::Array[Player],
        ruleset: Rules::RuleSet,
        market: Market,
        tournament_deck: TournamentDeck,
        workers: T::Array[Worker]
      ).void
    end
    def initialize(
      players:,
      ruleset: Rules::StandardRules.new,
      market: StandardMarket.new,
      tournament_deck: generate_tournament_deck,
      workers: generate_workers(players)
    )
      super() # required for state_machine
      @ruleset = ruleset # should be immutable
      @players = players # mutable
      @market = market # mutable
      @tournament_deck = tournament_deck # mutable
      @workers = workers # mutable
    end

    def generate_tournament_deck
      [] # TODO: write this
    end

    sig { params(players: T::Array[Player]).returns(T::Array[Worker]) }
    def generate_workers(players)
      players.flat_map do |player|
        Array.new(2) { Worker.new(player:) }
      end
    end

    def each_player(&block)
      players.enum_for(:each) unless block_given?
      players.each(&block)
    end

    def player = players.first

    def opponents = players[1..]

    def workers
      players.flat_map(&:workers)
    end

    def effect_evaluator = @effect_evaluator ||= EffectEvaluator.new(self)

    private

    def endgame_condition_met?
      tournament_deck.empty? || players.map(&:score).max >= 10
    end

    def action_phase_over?
      players.all?(&:done_with_actions?)
    end

    def buy_phase_over?
      players.all?(&:done_with_buys?)
    end

    def tournament_phase_over?
      players.all?(&:done_with_tournament?)
    end

    def no_active_troops?
      players.none? { |player| player.active_troops.any? }
    end

    def inspect
      %w[object_id phase players market].reduce("#<#{self.class.name}:0x#{object_id.to_s(16)}") do |str, attr|
        str << " #{attr}=#{send(attr).inspect}"
      end
    end
  end
  # rubocop:enable Metrics/ClassLength
end
