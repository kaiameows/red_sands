# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `wisper_next` gem.
# Please instead update this file by running `bin/tapioca gem wisper_next`.

# Default synchronous broadcaster which sends event to subscriber
#
# @api private
#
# source://wisper_next//lib/wisper_next/version.rb#1
module WisperNext
  class << self
    # @api private
    #
    # source://wisper_next//lib/wisper_next.rb#9
    def publisher; end

    # @api private
    #
    # source://wisper_next//lib/wisper_next.rb#13
    def subscriber(*args); end
  end
end

# @api private
#
# source://wisper_next//lib/wisper_next/cast_to_options.rb#3
class WisperNext::CastToOptions
  class << self
    # @api private
    # @example
    #
    #   def call(*args)
    #   CastToOptions.call(args)
    #   end
    #
    #   call(:strict, :async: false) # => { strict: true, async: false }
    #
    # source://wisper_next//lib/wisper_next/cast_to_options.rb#12
    def call(arguments); end
  end
end

# @api private
#
# source://wisper_next//lib/wisper_next.rb#7
class WisperNext::Error < ::StandardError; end

# @api public
#
# source://wisper_next//lib/wisper_next/events.rb#29
class WisperNext::Events
  include ::WisperNext::Publisher::Methods

  # source://wisper_next//lib/wisper_next/publisher.rb#108
  def broadcast(name, payload = T.unsafe(nil)); end
end

# Extension to provide objects with subscription and publishing capabilties
#
# class PromoteUser
#   include Wisper.publisher
#
#   def call
#     # ...
#     broadcast(:user_promoted, user_id: user.id, ts: Time.now)
#   end
# end
#
# class NotifyUserOfPromotion
#   def on_event(name, payload)
#     puts "#{name} => #{payload.inspect}"
#   end
# end
#
# command = PromoteUser.new
# command.subscribe(NotifyUserOfPromotion.new)
# command.call
#
# @api private
#
# source://wisper_next//lib/wisper_next/publisher.rb#26
class WisperNext::Publisher < ::Module
  # @api private
  #
  # source://wisper_next//lib/wisper_next/publisher.rb#27
  def included(descendant); end
end

# @api private
#
# source://wisper_next//lib/wisper_next/publisher/callable_adapter.rb#7
class WisperNext::Publisher::CallableAdapter
  # @api private
  # @return [CallableAdapter] a new instance of CallableAdapter
  #
  # source://wisper_next//lib/wisper_next/publisher/callable_adapter.rb#10
  def initialize(event_name, callable); end

  # @api private
  #
  # source://wisper_next//lib/wisper_next/publisher/callable_adapter.rb#22
  def ==(other); end

  # @api private
  #
  # source://wisper_next//lib/wisper_next/publisher/callable_adapter.rb#8
  def callable; end

  # @api private
  #
  # source://wisper_next//lib/wisper_next/publisher/callable_adapter.rb#8
  def event_name; end

  # @api private
  #
  # source://wisper_next//lib/wisper_next/publisher/callable_adapter.rb#16
  def on_event(name, payload); end
end

# Exception raised when a listener is already subscribed
#
# @api public
#
# source://wisper_next//lib/wisper_next/publisher.rb#36
class WisperNext::Publisher::ListenerAlreadyRegisteredError < ::StandardError
  # source://wisper_next//lib/wisper_next/publisher.rb#38
  def initialize(listener); end
end

# @api private
#
# source://wisper_next//lib/wisper_next/publisher.rb#54
module WisperNext::Publisher::Methods
  # subscribes the given block to an event
  #
  # @api public
  # @param event [String, Symbol] name
  # @raise [ArgumentError]
  # @return [Object] self
  #
  # source://wisper_next//lib/wisper_next/publisher.rb#90
  def on(name, &block); end

  # subscribes given listener
  #
  # @api public
  # @param listener [Object]
  # @raise [ListenerAlreadyRegisteredError]
  # @return [Object] self
  #
  # source://wisper_next//lib/wisper_next/publisher.rb#75
  def subscribe(listener); end

  # returns true when given listener is already subscribed
  #
  # @api public
  # @param listener [Object]
  # @return [Boolean]
  #
  # source://wisper_next//lib/wisper_next/publisher.rb#63
  def subscribed?(listener); end

  private

  # Broadcast event to all subscribed listeners
  #
  # @api public
  # @param event [String, Symbol] name
  # @param optional [Object] payload
  # @return [Object] self
  #
  # source://wisper_next//lib/wisper_next/publisher.rb#108
  def broadcast(name, payload = T.unsafe(nil)); end

  # Returns subscribed listeners
  #
  # @api private
  # @return [Array<Object>] collection of subscribers
  #
  # source://wisper_next//lib/wisper_next/publisher.rb#122
  def subscribers; end
end

# Exception raised when a listener does not have an #on_event method
#
# @api public
#
# source://wisper_next//lib/wisper_next/publisher.rb#47
class WisperNext::Publisher::NoEventHandlerError < ::ArgumentError
  # source://wisper_next//lib/wisper_next/publisher.rb#49
  def initialize(listener); end
end

# @api private
#
# source://wisper_next//lib/wisper_next/subscriber.rb#4
class WisperNext::Subscriber < ::Module
  # @api private
  # @return [Subscriber] a new instance of Subscriber
  #
  # source://wisper_next//lib/wisper_next/subscriber.rb#7
  def initialize(*args); end

  private

  # @api private
  #
  # source://wisper_next//lib/wisper_next/subscriber.rb#61
  def broadcaster_for(name, opts = T.unsafe(nil)); end

  # @api private
  #
  # source://wisper_next//lib/wisper_next/subscriber.rb#46
  def resolve_broadcaster(options); end
end

# @api private
#
# source://wisper_next//lib/wisper_next/subscriber.rb#5
WisperNext::Subscriber::EmptyHash = T.let(T.unsafe(nil), Hash)

# @api private
#
# source://wisper_next//lib/wisper_next/subscriber.rb#37
class WisperNext::Subscriber::NoMethodError < ::StandardError
  # source://wisper_next//lib/wisper_next/subscriber.rb#39
  def initialize(event_name); end
end

# @api private
#
# source://wisper_next//lib/wisper_next/subscriber/resolve_method.rb#3
class WisperNext::Subscriber::ResolveMethod
  class << self
    # @api private
    #
    # source://wisper_next//lib/wisper_next/subscriber/resolve_method.rb#4
    def call(name, prefix); end
  end
end

# @api private
#
# source://wisper_next//lib/wisper_next/subscriber/send_broadcaster.rb#6
class WisperNext::Subscriber::SendBroadcaster
  # @api private
  # @return [SendBroadcaster] a new instance of SendBroadcaster
  #
  # source://wisper_next//lib/wisper_next/subscriber/send_broadcaster.rb#7
  def initialize(options = T.unsafe(nil)); end

  # @api private
  #
  # source://wisper_next//lib/wisper_next/subscriber/send_broadcaster.rb#11
  def call(subscriber, event_name, payload); end
end

# @api private
#
# source://wisper_next//lib/wisper_next/version.rb#2
WisperNext::VERSION = T.let(T.unsafe(nil), String)