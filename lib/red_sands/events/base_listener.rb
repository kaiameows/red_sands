# typed: false
# frozen_string_literal: true

module RedSands
  module Events
    # BaseListener is the base class for all event listeners
    class BaseListener
      PreconditionNotMet = Class.new(StandardError) do
        def initialize(event)
          super("Precondition not met for event #{event.class.name}")
        end
      end

      include Ma.subscriber
      # events will probably trigger other events pretty regularly
      include Ma.publisher
      include RedSands::Events::Publisher

      def game_state
        RedSands::GameState.current
      end

      def check_precondition(model)
        raise(PreconditionNotMet, self) unless model.precondition.nil? || model.precondition.call
      end
    end
  end
end
