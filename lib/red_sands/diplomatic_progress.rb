# typed: true
# frozen_string_literal: true

require 'forwardable'

module RedSands
  # DiplomaticProgress is the progress of the diplomatic tracks for a player
  class DiplomaticProgress
    extend Forwardable

    def_delegators :@progress, :each, :keys, :values, :to_h, :[], :[]=
    def initialize(progress = defaults, alliances = [])
      @progress = progress
      @alliances = alliances
    end

    def defaults
      Faction.values.product([0]).to_h
    end
  end
end
