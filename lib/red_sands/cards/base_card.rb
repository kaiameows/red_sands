# frozen_string_literal: true

module RedSands
  module Cards
    FIELDS = %i[name power_cost faction sectors action_effect reveal_effect buy_effect trash_effect].freeze
    DEFAULTS = FIELDS[1..].product([nil]).to_h.freeze
    BaseCard = Data.define(*FIELDS) do
      def initialize(**atts) = super(**DEFAULTS.merge(atts))

      def to_s = name
    end
  end
end
