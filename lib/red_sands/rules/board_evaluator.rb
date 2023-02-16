# frozen_string_literal: true

require 'ostruct'

module RedSands
  module Rules
    # BoardEvaluator provides a DSL for defining a game board
    class BoardEvaluator < RuleFactory
      def sectors = @sectors ||= {}

      def sector(name, &)
        r = SectorEvaluator.new
        r.instance_eval(&)
        sectors[name] = r.attributes
      end

      def diplomatic_sector(name, &)
        sector(name, &)
        sectors[name][:diplomatic] = true
      end

      def planet_sector(name, &)
        sector(name, &)
        sectors[name][:planet] = true
      end
    end
  end
end
