# frozen_string_literal: true

module RedSands
  module Rules
    # BoardEvaluator provides a DSL for defining a game board
    class BoardEvaluator
      def initialize
        @sectors = {}
      end

      def sector(name, &)
        @sectors[name] = Sector.new(name).instance_eval(&)
      end

      def diplomatic_sector(name, &)
        sector(name, &).tap do |sector|
          sector.type = :diplomatic
          sector.counter = DiplomaticCounter.new(alliance_bonus: sector.alliance_bonus)
        end
      end

      def planet_sector(name, &)
        sector(name, &).tap do |sector|
          sector.type = :planet
        end
      end
    end
  end
end
