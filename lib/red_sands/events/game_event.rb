# frozen_string_literal: true

require 'forwardable'

module RedSands
  module Events
    # GameEvent is the base class for all game events
    class GameEvent < Ma::Event
      extend Forwardable
      def_delegators :@game_state, :player, :opponents, :each_player, :decks

      attr_reader :game_state

      def initialize(game_state = GameState.current, **args)
        super
        @game_state = game_state
        @arguments = args
      end
    end
  end
end
