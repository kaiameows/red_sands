# typed: strict
# frozen_string_literal: true

module RedSands
  # cards can have one or more associated factions
  class Faction < T::Enum
    enums do
      Empire = new('Empire')
      Magic = new('Magic')
      Warrior = new('Warrior')
      Guild = new('Guild')
    end
  end
end
