# typed: strict
# frozen_string_literal: true

module RedSands
  module Concerns
    # Drawable extends the location state machine to allow transitions from :deck to :hand
    module Drawable
      extend T::Sig

      sig { params(mod: Module).void }
      def self.included(mod)
        mod.class_eval do
          state_machine :location do
            event :draw do
              transition deck: :hand
            end

            event :reshuffle do
              transition discard: :deck
            end
          end
        end
      end
    end
  end
end
