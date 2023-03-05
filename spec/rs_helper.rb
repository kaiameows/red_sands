# typed: strict
# frozen_string_literal: true

require 'bundler/setup'
require 'factory_bot'
require 'faker'
require 'pry-byebug'
require 'red_sands'
require 'rspec/its'
require 'rspec/collection_matchers'
require 'wisper/rspec/matchers'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.include Wisper::RSpec::BroadcastMatcher
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
