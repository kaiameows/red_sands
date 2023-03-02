# typed: strict
# frozen_string_literal: true

module RedSands
  module Concerns
    # Exileable extends the location state machine to allow transitions from :hand or :play or :discard to :exile
    module Exileable
      extend T::Sig

      sig { params(mod: Module).void }
      def self.included(mod)
        mod.class_eval do
          state_machine :location do
            event :exile do
              transition %i[hand play discard] => :exile
            end
          end
        end
      end
    end
  end
end
