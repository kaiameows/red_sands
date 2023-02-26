# typed: true
# frozen_string_literal: true

module RedSands
  # DiplomaticProgress is the progress of the diplomatic tracks for a player
  class DiplomaticProgress
    def initialize(progress = defaults, alliances = [])
      @progress = progress
      @alliances = alliances
    end

    def defaults
      %w[Empire Magic Guild Warrior].product([0]).to_h
    end
  end
end
