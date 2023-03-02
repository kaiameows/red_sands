# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # StarterCards are identical to BaseCards but their initial state is :deck
    class StarterCard < BaseCard
      extend T::Sig
      # rubocop:disable Lint/EmptyBlock
      state_machine(:location, initial: :deck) do
      end
      # rubocop:enable Lint/EmptyBlock
      include Concerns::Drawable

      sig do
        params(
          name: String,
          action_effect: T.nilable(T.proc.returns(Effect)),
          sectors: T::Array[String],
          reveal_effect: T.nilable(T.proc.returns(Effect))
        ).void
      end
      def initialize(name:, action_effect: nil, sectors: [], reveal_effect: nil)
        super()
        @name = name
        @action_effect = action_effect
        @sectors = sectors
        @reveal_effect = reveal_effect
      end
    end
  end
end
