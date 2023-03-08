# typed: true
# frozen_string_literal: true

module RedSands
  module Rules
    # base class for rulesets
    # a ruleset is a collection of rules that define how the game is played
    # a standard game involves three players
    # rules for two-player games or single-player games may be out of scope
    # in theory it would be nice to support the expansion(s) but we'll see how far I get
    class RuleSet
      def initialize(board:, market:, **options)
        @board = board
        @market = market
        @options = options
      end

      def standard_board
        Boards::StandardBoard
      end

      def standard_market
        StandardMarket.new
      end
    end
  end
end
