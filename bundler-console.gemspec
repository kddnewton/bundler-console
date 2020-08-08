# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler/console/version'

Gem::Specification.new do |spec|
  spec.name          = 'bundler-console'
  spec.version       = Bundler::Console::VERSION
  spec.authors       = ['Kevin Deisz']
  spec.email         = ['kevin.deisz@gmail.com']

  spec.summary       = 'A bundler plugin that starts a console session with ' \
                       'your gem dependencies.'
  spec.homepage      = 'https://github.com/kddeisz/bundler-console'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.11'
  spec.add_development_dependency 'rake', '~> 13.0'
end
