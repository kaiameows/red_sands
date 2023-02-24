# frozen_string_literal: true

require 'ma'
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

