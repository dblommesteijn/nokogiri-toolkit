# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nokogiri/toolkit/version'

Gem::Specification.new do |spec|
  spec.name          = "nokogiri-toolkit"
  spec.version       = Nokogiri::Toolkit::VERSION
  spec.authors       = ["Dennis Blommesteijn"]
  spec.email         = ["dennis@blommesteijn.com"]
  spec.description   = %q{Personal Nokogiri toolkit. A wrapper (toolkit) extend new features into Nokogiri without pull requests.}
  spec.summary       = %q{Personal Nokogiri toolkit. A wrapper (toolkit) extend new features into Nokogiri without pull requests. }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  # dependencies
  spec.add_dependency 'nokogiri', "~> 1.5.0"
  spec.add_development_dependency "test-unit", "~> 2.0.0"
end
