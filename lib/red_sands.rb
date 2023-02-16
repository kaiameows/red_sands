# frozen_string_literal: true

require 'ma'
require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
# loader.ignore("#{__dir__}/red_sands/rules/*_rules.rb")
loader.ignore("#{__dir__}/red_sands/rules/*_leaders.rb")
loader.ignore("#{__dir__}/red_sands/events/*events.rb")
loader.setup

# RedSands models a space-themed strategy game
module RedSands; end

loader.eager_load

Dir["#{__dir__}/red_sands/events/*events.rb"].each do |file|
  require file
end

# Dir["#{__dir__}/red_sands/rules/*_rules.rb"].each do |file|
#   require file
# end
