# frozen_string_literal: true

module RedSands
  module Troops
    # NormalTroop is the basic troop type
    class NormalTroop < BaseTroop
      add_flag :destructible, true
    end
  end
end
