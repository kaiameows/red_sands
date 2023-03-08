# typed: true
# frozen_string_literal: true

require 'ostruct'

module RedSands
  module Rules
    # BoardEvaluator provides a DSL for defining a game board
    class BoardEvaluator < RuleFactory
      def locations = @locations ||= []

      # sectors are not actual objects, they're a flag on the location
      def sector(name, &blk)
        locations << LocationEvaluator.new(sector: name).tap do |evaluator|
          evaluator.instance_eval(&blk)
        end.build
      end

      def build
        Board.new(locations:).tap do |board|
          boolean_attributes.each { |k, v| board.add_flag(k, v) }
        end
      end
    end
  end
end
