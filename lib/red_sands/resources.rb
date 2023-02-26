# typed: true
# frozen_string_literal: true

module RedSands
  # This class is a container for player resources
  class Resources < OpenStruct
    def initialize(food: 1, gems: 0, money: 0, score: 0)
      super(food:, gems:, money:, score:)
    end
  end
end
