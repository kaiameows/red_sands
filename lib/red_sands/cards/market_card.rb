# typed: false
# frozen_string_literal: true

module RedSands
  module Cards
    # StandardBuyableCard is a card that can be bought from the market
    class MarketCard < BaseCard
      extend T::Sig
      EffectProc = T.type_alias { T.proc.returns(Effect) }

      # rubocop:disable Lint/EmptyBlock
      state_machine(:location, initial: :market) do
      end
      # rubocop:enable Lint/EmptyBlock
      include Concerns::Flaggable
      include Concerns::Playable
      include Concerns::Buyable
      include Concerns::Discardable
      include Concerns::Exileable
      include Concerns::Drawable

      sig { returns(Integer) }
      attr_reader :power_cost

      sig { returns(T::Array[Faction]) }
      attr_reader :factions

      sig { returns(T::Array[String]) }
      attr_reader :sectors

      sig { returns(T.nilable(EffectProc)) }
      attr_reader :buy_effect

      sig { returns(T.nilable(EffectProc)) }
      attr_reader :reveal_effect

      sig { returns(T.nilable(EffectProc)) }
      attr_reader :action_effect

      sig do
        params(
          name: String,
          power_cost: Integer,
          factions: T::Array[Faction],
          sectors: T::Array[String],
          buy_effect: T.nilable(EffectProc),
          reveal_effect: T.nilable(EffectProc),
          action_effect: T.nilable(EffectProc)
        ).void
      end
      # rubocop:disable Metrics/ParameterLists
      def initialize(name:, power_cost:, factions: [], sectors: [], buy_effect: nil, reveal_effect: nil, action_effect: nil)
        super()
        @name = name
        @power_cost = power_cost
        @factions = factions
        @sectors = sectors
        @buy_effect = buy_effect
        @reveal_effect = reveal_effect
        @action_effect = action_effect
      end
      # rubocop:enable Metrics/ParameterLists
    end
  end
end
