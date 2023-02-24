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

  placeholder :might_have do
    match(/has a/) { true }

    match(/does not have a/) { false }
  end

  placeholder :resource do
    match(/(power|gems|money|score|workers)/, &:to_sym)
    match(/troops in reserve/) { :reserve_troops }
    match(/active troops/) { :active_troops }
  end
end
