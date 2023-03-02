# typed: strict
# frozen_string_literal: true

module RedSands
  module Concerns
    # Playable is a concern that adds to the location state machine
    # probably. idk if these can be inherited like this
    module Playable
      extend T::Sig

      sig { params(mod: Module).void }
      # rubocop:disable Metrics/MethodLength
      def self.included(mod)
        mod.class_eval do
          state_machine :location do
            event :play do
              transition %i[hand] => :play
            end

            event :discard do
              transition %i[hand play] => :discard
            end

            event :exile do
              transition %i[hand play discard] => :exile
            end
          end
        end
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
