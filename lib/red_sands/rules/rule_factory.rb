# typed: true
# frozen_string_literal: true

module RedSands
  module Rules
    # RuleFactory is a helper class that enables a lot of neat DSL tricks
    class RuleFactory
      attr_reader :attributes

      def initialize
        @attributes = {}
      end

      def boolean_attributes = attributes.select { |_, v| [true, false].include?(v) }

      def method_missing(name, *args, &block)
        @attributes[name] = if block_given?
                              args.any? ? [*args, block] : block
                            elsif args.empty?
                              true
                            elsif args.size == 1
                              args.first
                            else
                              args
                            end
      end

      def respond_to_missing?(_name, _include_private = false) = true
    end
  end
end
