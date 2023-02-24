# frozen_string_literal: true

require 'forwardable'

module RedSands
  # GameState encapsulates the state of the game
  class GameState < BaseModel
    extend Forwardable
    attr_reader :players
    attr_accessor :ruleset, :market

    def_delegators :@ruleset, :board, :decks

    def self.current = @current ||= new(
      ruleset: RedSands::Rules::RuleManager.current,
      players: Array.new(2) { RedSands::Player.new }
    )

    def initialize(ruleset:, players:, market: StandardMarket.new, phase: nil)
      @ruleset = ruleset
      @players = players
      @market = market
      @phase = phase
    end

    def game_over? = @game_over || false

    def game_over!
      @game_over = true
    end

    def each_player(&)
      players.enum_for(:each) unless block_given?
      players.each(&)
    end

    def player = players.first

    def opponents = players[1..]

    def effect_evaluator = @effect_evaluator ||= EffectEvaluator.new(self)

    def start
      publish(RedSands::Events::GameStart)
      main_game_loop until current.game_over?
      broadcast(RedSands::Events::GameEnd.new)
    end

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
    #    - secret power cards can be played any time the player is able to take an action
    #    - secret power cards may not be played during an opponent's action
    # 3. Tournament Phase
    #   - Players during the action phase may move troops to the tournament location
    #   - A player's total combat power is based on the number of troops they have in the tournament
    #   - Combat power can be increased by other card effects, but card effects do not provide any combat bonus unless the player has troops in the tournament
    #   - Before combat is resolved, each player may take it in turn to play a tournament-category secret power card
    #   - Combat is resolved by comparing the total combat power of each player
    #   - The player with the highest combat power wins the tournament and the first-place prize is awarded
    #     The second-highest combat power wins the second-place prize
    #   - If there are four players, the player with the third-highest combat power wins the third-place prize
    #   - If there is a tie, no one wins, and the tied players both receive the second-place prize
    #   - After the tournament is resolved, all non-indestructible troops are destroyed
    #   - Some secret power cards can be played after a tournament is won
    # 4. Resolution Phase
    #   - add gems to all gem accumulator locations
    #   - If the tournament deck is empty, or if a player has a score of 10 or more, the Endgame phase is triggered
    #   - Otherwise, the next turn begins
    def main_game_loop
      with_hooks(RedSands::Events::Turn) do
        draw_phase
        action_phase
        tournament_phase
        resolution_phase
      end
    end

    def draw_phase
      publish(RedSands::Events::DrawPhase)
    end

    def action_phase
      publish(RedSands::Events::ActionPhase)
    end

    def tournament_phase
      publish(RedSands::Events::TournamentPhase)
    end

    def resolution_phase
      publish(RedSands::Events::ResolutionPhase)
    end

    def endgame_condition_met?
      decks[:tournament].empty? || players.map(&:score).max >= 10
    end

    def endgame_phase
      # this could just as easily be an event
      broadcast(RedSands::Events::BeforeEndgamePhase.new)
      broadcast(RedSands::Events::EndgamePhase.new)
      each_player(&:take_action) # players may play any secret power cards they have, in turn, with each player getting one chance to play a card
      # the player with the highest score wins. If there is a tie, the tiebreaker values are, in order: gems, money, water, reserve troops
      winner = players.max_by do |player|
        [player.score, player.gems, player.money, player.water, player.reserve_troops]
      end
      broadcast(RedSands::Events::PlayerWins.new(player: winner))
    end
  end
end
