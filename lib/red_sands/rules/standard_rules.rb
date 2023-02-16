# frozen_string_literal: true

module RedSands
  module Rules
    # StandardRules are the default rules for Red Sands
    class StandardRules < RuleSet
      def initialize(board: StandardBoard, decks: standard_decks, **options)
        super(board:, decks:, **options)
      end
    end
  end
end
