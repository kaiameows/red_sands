# typed: strict
# frozen_string_literal: true

module RedSands
  module Concerns
    # Discardable extends the location state machine to allow transitions from :hand or :play to :discard
    module Discardable
      extend T::Sig

      sig { params(mod: Module).void }
      def self.included(mod)
        mod.class_eval do
          state_machine :location do
            event :discard do
              transition %i[hand play] => :discard
            end
          end
        end
      end
    end
  end
end
