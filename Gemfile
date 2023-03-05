# frozen_string_literal: true

source 'https://rubygems.org'
gemspec

ruby '3.2.1'

gem 'deep_dup', '~> 0.0.3'
gem 'ice_nine', '~> 0.11.2'
gem 'sorbet', '~> 0.5.10687'
gem 'sorbet-runtime', '~> 0.5.10687'
gem 'state_machines', '~> 0.5.0'
gem 'tapioca', require: false, group: :development
gem 'wisper', '~> 2.0.0'

group :test do
  gem 'rubocop-sorbet', require: false
end

group :development do
  gem 'ruby-lsp', require: false
end

group :development, :test do
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'wisper-rspec'
end
