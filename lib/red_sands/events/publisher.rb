# typed: false
# frozen_string_literal: true

module RedSands
  # Events is the events module. What do you want?
  module Events
    # Publisher extends Wisper::Publisher to trigger Before and After events as well as the original event
    module Publisher
      extend Wisper::Publisher
      def publish(event, **args)
        hook_names_for_event(event).each do |event_name|
          broadcast(event_name, **args)
        end
      end

      # this really seems like it should be part of the event
      def with_hooks(event)
        before, _, after = hook_names_for_event(event)
        broadcast(before)
        broadcast(event)
        yield
        broadcast(after)
      end

      private

      def hook_names_for_event(event)
        ["before_#{event}", event, "after_#{event}"]
      end
    end
  end
end
