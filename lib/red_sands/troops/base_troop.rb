# typed: strict
# frozen_string_literal: true

module RedSands
  module Troops
    # BaseTroop is the base class for all troops
    class BaseTroop < BaseModel
      extend T::Sig
      include RedSands::Concerns::Flaggable

      state_machine :deployment_state, initial: :spawned do
        event :activate do
          transition %i[spawned inactive] => :active
        end

        event :reserve do
          transition spawned: :inactive
        end
      end

      sig { returns(Symbol) }
      attr_reader :type

      sig { returns(Integer) }
      attr_accessor :power

      sig { params(type: Symbol, power: Integer).void }
      def initialize(type: :normal, power: 2)
        super()
        @type = type
        @power = power
      end
    end
  end
end
