# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagylight/version'

Gem::Specification.new do |spec|
  spec.name          = 'pagylight'
  spec.version       = Pagylight::VERSION
  spec.authors       = ['Andrew Yasinishyn']
  spec.email         = ['yasinishyn.a.n@gmail.com']
  spec.description   = %q{Light pagination.}
  spec.summary       = %q{Light pagination.}
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'activesupport'
end