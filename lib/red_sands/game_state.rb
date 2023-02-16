# frozen_string_literal: true

require 'forwardable'

module RedSands
  # GameState encapsulates the state of the game
  class GameState
    extend Forwardable
    attr_reader :players

    def_delegators :@ruleset, :board

    def initialize(ruleset, players)
      @ruleset = ruleset
      @players = players
    end

    def each_player(&)
      players.enum_for(:each) unless block_given?
      players.each(&)
    end
  end
end
