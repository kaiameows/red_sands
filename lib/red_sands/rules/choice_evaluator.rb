# typed: strict
# frozen_string_literal: true

module RedSands
  module Rules
    # provides a DSL for expressing choices
    class ChoiceEvaluator
      extend T::Sig

      sig { params(description: String).void }
      def initialize(description:)
        @description = T.let(description, T.nilable(String))
      end

      sig { returns(T::Hash[String, T.untyped]) }
      def options
        @options ||= T.let(nil, T.nilable(T::Hash[String, T.untyped]))
        @options ||= {}
      end

      sig { params(name: String, block: T.proc.returns(T.untyped)).void }
      def option(name, &block)
        options[name] = OptionEvaluator.new.tap do |evaluator|
          evaluator.instance_eval(&block)
        end.attributes
      end
    end
  end
end
