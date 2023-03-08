# typed: strict
# frozen_string_literal: true

module RedSands
  # Board encapsulates the game board state
  class Board < BaseModel
    extend T::Sig
    SectorHash = T.type_alias { T::Hash[Sector, T::Array[Location]] }
    SectorPair = T.type_alias { [Sector, T::Array[Location]] }
    sig { returns(T::Array[Location]) }
    attr_reader :locations

    sig { params(locations: T::Array[Location]).void }
    def initialize(locations: [])
      @locations = locations
    end

    sig do
      params(
        block: T.nilable(T.proc.params(arg0: SectorPair).returns(BasicObject))
      ).returns(
        T.any(SectorHash, T::Enumerator[SectorPair])
      )
    end
    def each_sector(&block)
      sectors.enum_for(:each) unless block_given?
      sectors.each(&block)
    end

    sig { returns(SectorHash) }
    def sectors
      locations.group_by(&:sector)
    end
  end
end
