# typed: false
# frozen_string_literal: true

module RedSands
  # Events is the events module. What do you want?
  module Events
    # Publisher extends Ma::Publisher to trigger Before and After events as well as the original event
    module Publisher
      def publish(event, **args)
        hook_names_for_event(event).each do |event_name|
          broadcast(RedSands.const_get(event_name).new(**args))
        end
      end

      # this really seems like it should be part of the event
      def with_hooks(event)
        hooks = hook_names_for_event(event).map { |event_name| RedSands.const_get(event_name).new }
        broadcast(hooks.first)
        broadcast(hooks[1])
        yield
        broadcast(hooks.last)
      end

      private 

      def hook_names_for_event(event)
        *namespace, name = event.name.split('::')
        ["#{namespace.join('::')}::Before#{name}", event.name, "#{namespace.join('::')}::After#{name}"]
      end
    end
  end
end
