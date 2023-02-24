# frozen_string_literal: true

RSpec.configure do |config|
  Dir[File.join(__dir__, 'steps', '**', '*_steps.rb')].each do |file|
    klass = File.basename(file, '.rb').gsub(/([a-z]+)_?/) { $1.capitalize }
    require file
    config.include Object.const_get(klass)
  end
end
