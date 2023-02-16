# frozen_string_literal: true

require 'forwardable'

module RedSands
  # GameState encapsulates the state of the game
  class GameState
    extend Forwardable
    attr_reader :players
    attr_accessor :ruleset

    def_delegators :@ruleset, :board, :decks

    def self.current = @current ||= new(RuleManager.current, [Player.new, Player.new])

    def initialize(ruleset, players)
      @ruleset = ruleset
      @players = players
    end

    def each_player(&)
      players.enum_for(:each) unless block_given?
      players.each(&)
    end

    def player = players.first

    def opponents = players[1..]
  end
end
