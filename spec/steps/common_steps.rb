# typed: false
# frozen_string_literal: true

module CommonSteps
  extend Turnip::DSL

  placeholder :count do
    match(/(\d+)/, &:to_i)
  end

  placeholder :whether_to do
    match(/should/) { true }

    match(/should not/) { false }
  end

  placeholder :can_has do
    match(/has/) { true }

    match(/does not have/) { false }
  end

  placeholder :resource do
    match(/(power|gems|money|score|workers|food)/, &:to_sym)
  end

  placeholder :deck_type do
    match(/(secret power|buyable|tournament|tesseract|warrior|mother lode)/) { |type| type.gsub(' ', '_').to_sym }
  end

  placeholder :troop_status do
    match(/active|reserve/) { |status| "#{status}_troops".to_sym }
  end

  # rubocop:disable Lint/Debugger
  step 'binding.pry' do
    binding.pry
  end
  # rubocop:enable Lint/Debugger
end
