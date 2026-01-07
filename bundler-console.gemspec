# frozen_string_literal: true

require_relative "lib/bundler/console/version"

version = Bundler::Console::VERSION
repository = "https://github.com/kddnewton/bundler-console"

Gem::Specification.new do |spec|
  spec.name = "bundler-console"
  spec.version = version
  spec.authors = ["Kevin Newton"]
  spec.email = ["kddnewton@gmail.com"]

  spec.summary =
    "A bundler plugin that starts a console session with " \
      "your gem dependencies."
  spec.homepage = repository
  spec.license = "MIT"

  spec.metadata = {
    "bug_tracker_uri" => "#{repository}/issues",
    "changelog_uri" => "#{repository}/blob/v#{version}/CHANGELOG.md",
    "source_code_uri" => repository,
    "rubygems_mfa_required" => "true"
  }

  spec.files = %w[
    CHANGELOG.md
    CODE_OF_CONDUCT.md
    LICENSE
    README.md
    bundler-console.gemspec
    lib/bundler/console.rb
    lib/bundler/console/version.rb
    plugins.rb
  ]

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-mock"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "syntax_tree"
end
