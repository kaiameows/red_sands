# typed: strict
# frozen_string_literal: true

require 'ice_nine'
require 'ice_nine/core_ext/object'
require 'ma'
require 'sorbet-runtime'
require 'state_machines'
require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
# loader.ignore("#{__dir__}/red_sands/rules/*_leaders.rb")
loader.ignore("#{__dir__}/red_sands/events/*events.rb")
Dir["#{__dir__}/red_sands/events/*events.rb"].each do |file|
  require file
end
loader.setup

# RedSands models a space-themed strategy game
module RedSands; end

loader.eager_load

