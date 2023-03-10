# typed: false
# frozen_string_literal: true

module RedSands
  # Players each have an associated leader who provides unique abilities
  # Leaders have an active power and a passive power
  class Leader < BaseModel
    attr_reader :name, :active_power, :passive_power_description

    def initialize(name:, active_power:, passive_power_description:)
      @name = name
      @active_power = active_power
      @passive_power_description = passive_power_description
    end
  end
end
