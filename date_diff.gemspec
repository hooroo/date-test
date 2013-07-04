# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_diff/version'

Gem::Specification.new do |spec|
  spec.name          = "date_diff"
  spec.version       = DateDiff::VERSION
  spec.authors       = ["Ash McKenzie"]
  spec.email         = ["ash@greenworm.com.au"]
  spec.description   = %q{DateDiff: Determine the number of days difference between two dates}
  spec.summary       = %q{DateDiff: Determine the number of days difference between two dates}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "minitest-reporters"
end
