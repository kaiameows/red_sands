# frozen_string_literal: true

module RedSands
  module Rules
    # StandardRules are the default rules for Red Sands
    class StandardRules < RuleSet
      def initialize(board: standard_board, market: standard_market, **options)
        super(board:, market:, **options)
      end
    end
  end
end
