# typed: true
# frozen_string_literal: true

require 'forwardable'

module RedSands
  module Rules
    # StandardRules are the default rules for Red Sands
    class StandardRules < RuleSet
      extend Forwardable

      def_delegators :@market, :decks

      def initialize(board: standard_board, market: standard_market, **options)
        super(board:, market:, **options)
      end
    end
  end
end
