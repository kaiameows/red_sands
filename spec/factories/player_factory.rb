# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :player, class: RedSands::Player do
    name { Faker::Fantasy::Tolkien.character }
    initialize_with { new(name) }
  end
end
