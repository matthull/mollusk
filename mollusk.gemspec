# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mollusk/version'

Gem::Specification.new do |spec|
  spec.name          = "mollusk"
  spec.version       = Mollusk::VERSION
  spec.authors       = ["Matt Hull"]
  spec.email         = ["matt@matthull.io"]
  spec.summary       = %q{Chainable filters for arrays, ActiveRecord-style}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "5.4.0"
end
