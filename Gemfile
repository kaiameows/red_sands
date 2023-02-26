# frozen_string_literal: true

source 'https://rubygems.org'
gemspec

ruby '3.2.1'

gem 'deep_dup', '~> 0.0.3'
gem 'ice_nine', '~> 0.11.2'
gem 'ma', '~> 0.1.0', git: 'https://gitlab.com/kris.leech/ma.git', branch: 'main'
gem 'sorbet', '~> 0.5.10687'
gem 'sorbet-runtime', '~> 0.5.10687'
gem 'state_machines', '~> 0.5.0'
gem 'tapioca', require: false, group: :development

group :development, :test do
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'wisper-rspec'
end
