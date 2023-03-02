# typed: strict
# frozen_string_literal: true

module RedSands
  module Concerns
    # Buyable extends the location state machine to allow transitions from :market to :hand or :discard or :deck
    module Buyable
      extend T::Sig

      sig { params(mod: Module).void }
      # rubocop:disable Metrics/MethodLength
      def self.included(mod)
        mod.class_eval do
          add_flag :buy_to_hand, false
          add_flag :buy_to_play, false
          state_machine :location do
            event :buy do
              transition market: :hand, if: :buy_to_hand?
              transition market: :play, if: :buy_to_play?
              transition market: :discard
            end
          end
        end
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
