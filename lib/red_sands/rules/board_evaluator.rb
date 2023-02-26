# typed: true
# frozen_string_literal: true

require 'ostruct'

module RedSands
  module Rules
    # BoardEvaluator provides a DSL for defining a game board
    class BoardEvaluator < RuleFactory
      def sectors = @sectors ||= []

      def sector(name, &)
        sectors << SectorEvaluator.new.tap do |evaluator|
          evaluator.name name
          evaluator.instance_eval(&)
        end.build
      end

      def diplomatic_sector(name, &)
        sector(name, &)
        sectors.last.add_flag(:diplomatic, true)
      end

      def planet_sector(name, &)
        sector(name, &)
        sectors.last.add_flag(:planet, true)
      end

      def build
        RedSands::Board.new(name: attributes[:name], sectors:).tap do |board|
          boolean_attributes.each { |k, v| board.add_flag(k, v) }
        end
      end
    end
  end
end
