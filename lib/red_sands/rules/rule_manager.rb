# typed: true
# frozen_string_literal: true

module RedSands
  module Rules
  # RuleManager is responsible for choosing the ruleset to use
    class RuleManager
      def self.current
        @current ||= choose_rules
      end

      def self.choose_rules
        # TODO: Allow rules to be chosen at runtime
        # presumably there will be some form of input for this project at some point
        # but for now we'll just return the default
        Rules::StandardRules.new
      end
    end
  end
end
