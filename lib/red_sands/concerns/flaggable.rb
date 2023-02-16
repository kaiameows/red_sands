# frozen_string_literal: true

module RedSands
  module Concerns
    # Flaggable allows boolean flags to be added to classes
    module Flaggable
      module ClassMethods
        def flag_methods_for(name, initial_value)
          {
            name => -> { flags[name] ||= initial_value },
            "#{name}?".to_sym => -> { flags[name] ||= initial_value },
            "#{name}=".to_sym => -> (value) { flags[name] = value }
          }
        end

        def add_flag(name, initial_value)
          flag_methods_for(name, initial_value).each do |method_name, method_body|
            define_method(method_name, &method_body) unless instance_methods.include?(method_name)
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
        self.class.flag_methods_for(name, value).each do |method_name, method_body|
          unless singleton_class.instance_methods.include?(method_name)
            define_singleton_method(method_name, &method_body)
          end
        end
      end

      def flag?(name)
        flags[name]
      end
    end
  end
end
