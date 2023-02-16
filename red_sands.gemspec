# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'red_sands'
  spec.version       = '0.1.0'
  spec.authors       = ['Kaia Meows']
  spec.email         = 'canhascodez@gmail.com'
  spec.licenses      = ['MIT']
  spec.summary       = 'A space-themed strategy game'
  spec.description   = 'A space-themed strategy game'
  spec.homepage      = ''
  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.required_ruby_version = Gem::Requirement.new('>= 3.2.1')
  spec.metadata['rubygems_mfa_required'] = 'true'
end
