# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capitalone_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'capitalone_client'
  spec.version       = CapitalOneClient::VERSION
  spec.authors       = ['Mickael Pham']
  spec.email         = ['mickael.pham@gmail.com']
  spec.summary       = %q{Capital One API Ruby client}
  spec.homepage      = 'https://github.com/mickaelpham/capitalone_client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'
  spec.add_runtime_dependency 'hashie'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
