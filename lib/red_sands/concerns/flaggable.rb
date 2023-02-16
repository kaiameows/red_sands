# frozen_string_literal: true

module RedSands
  module Concerns
    # Flaggable allows boolean flags to be added to classes
    module Flaggable
      module ClassMethods
        def add_flag(name, default_value)
          define_method(name) do
            flags[name] ||= default_value
          end
          define_method("#{name}?") do
            flags[name] ||= default_value
          end
          define_method("#{name}=") do |value|
            flags[name] = value
          end
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end

      def flags
        @flags ||= {}
      end

      def add_flag(name, value)
        flags[name] = value
      end

      def flag?(name)
        flags[name]
      end
    end
  end
end
