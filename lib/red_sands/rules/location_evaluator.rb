# frozen_string_literal: true

module RedSands
  module Rules
    # LocationEvaluator provides a DSL for creating locations
    class LocationEvaluator
      def cost(resources)
        @cost = resources
      end
    end
  end
end
