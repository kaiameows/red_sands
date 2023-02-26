# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/ma/all/ma.rbi
#
# ma-b516b5e05a58

module Ma
  def self.publisher; end
  def self.subscriber(*args); end
end
class Ma::Publisher < Module
  def included(base); end
end
module Ma::Publisher::Overrides
  def broadcast(event); end
end
class Ma::Subscriber < Module
  def included(base); end
  def initialize(*args); end
  def options; end
end
module Ma::Subscriber::ClassMethods
  def on(event_class, &block); end
end
class Ma::Event < OpenStruct
  def initialize(*args); end
end
class Ma::Error < StandardError
end
