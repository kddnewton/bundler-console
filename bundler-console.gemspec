# frozen_string_literal: true

require_relative 'lib/bundler/console/version'

version = Bundler::Console::VERSION
repository = 'https://github.com/kddnewton/bundler-console'

Gem::Specification.new do |spec|
  spec.name          = 'bundler-console'
  spec.version       = version
  spec.authors       = ['Kevin Newton']
  spec.email         = ['kddnewton@gmail.com']

  spec.summary       = 'A bundler plugin that starts a console session with ' \
                       'your gem dependencies.'
  spec.homepage      = repository
  spec.license       = 'MIT'

  spec.metadata      = {
    'bug_tracker_uri' => "#{repository}/issues",
    'changelog_uri' => "#{repository}/blob/v#{version}/CHANGELOG.md",
    'source_code_uri' => repository,
    'rubygems_mfa_required' => 'true'
  }

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.11'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.12'
  spec.add_development_dependency 'simplecov', '~> 0.19'
end
