# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'industrial_girl/version'

Gem::Specification.new do |spec|
  spec.name          = "industrial_girl"
  spec.version       = IndustrialGirl::VERSION
  spec.authors       = ["Dan Bickford"]
  spec.email         = ["danbickford007@yahoo.com"]
  spec.description   = %q{Factory Girl factory creater}
  spec.summary       = %q{Industrial Girl creates your factories quickly for Factory Girl, either
  in a single file or multiple file while using faker}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "faker"
  spec.add_dependency "active_record"
end
