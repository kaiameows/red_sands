# frozen_string_literal: true

require 'bundler/setup'
require 'red_sands'
require 'rspec/its'
require 'rspec/collection_matchers'
require 'pry-byebug'
require 'factory_bot'
require 'faker'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
