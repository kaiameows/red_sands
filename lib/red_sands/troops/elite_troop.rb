# typed: true
# frozen_string_literal: true

module RedSands
  module Troops
    # EliteTroop is stronger and indestructible
    class EliteTroop < BaseTroop
      add_flag :destructible, false
      def initialize
        super(type: :elite, power: 3)
      end
    end
  end
end
