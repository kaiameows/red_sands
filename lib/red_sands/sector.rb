# frozen_string_literal: true

module RedSands
  # Sectors are groups of locations on the board
  class Sector < BaseModel
    include RedSands::Concerns::Flaggable
    attr_reader :name, :locations

    def initialize(name:, locations: [])
      @name = name
      @locations = locations
    end
  end
end
