# typed: strict
# frozen_string_literal: true

module RedSands
  # sector is an enum
  class Sector < T::Enum
    enums do
      Empire = new
      Guild = new
      Magic = new
      Warrior = new
      Inhabited = new
      Uninhabited = new
      HallOfHeroes = new
      Alchemist = new
    end

    class << self
      extend T::Sig

      sig { returns(T::Array[Sector]) }
      def diplomatic
        [Empire, Guild, Magic, Warrior]
      end
    end
  end
end
