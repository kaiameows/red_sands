# typed: true
# frozen_string_literal: true

module RedSands
  # Board encapsulates the game board state
  class Board < BaseModel
    attr_reader :sectors

    def initialize(name:, sectors: [])
      @name = name
      @sectors = sectors
    end

    def each_sector(&)
      sectors.enum_for(:each) unless block_given?
      sectors.each(&)
    end

    def locations
      sectors.flat_map(&:locations)
    end
  end
end
