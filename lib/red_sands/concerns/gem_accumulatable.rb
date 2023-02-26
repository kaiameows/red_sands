# typed: true
# frozen_string_literal: true

module RedSands
  module Concerns
    # GemAccumulatable allows locations to accumulate gems
    module GemAccumulatable
      def accumulated_gems
        @accumulated_gems || 0
      end

      # included do
      #   add_flag :gem_accumulator, true
      # end
    end
  end
end
