# frozen_string_literal: true

module RedSands
  module Troops
    # BaseTroop is the base class for all troops
    class BaseTroop < BaseModel
      include RedSands::Concerns::Flaggable
      attr_reader :type
      attr_accessor :power

      def initialize(type: :normal, power: 2)
        @type = type
        @power = power
      end

      def self.[](**)
        new(**)
      end
    end
  end
end
