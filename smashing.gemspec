# frozen_string_literal: true

require_relative "lib/smashing/version"

Gem::Specification.new do |spec|
  spec.name = "smashing"
  spec.version = Smashing::VERSION
  spec.authors = ["Sergey Bezugliy"]
  spec.email = ["s.bezugliy@gmail.com"]

  spec.summary = "Smashing"
  spec.description = "Smashing wallpaper"
  spec.homepage = "https://github.org/sbezugliy/smashing"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.org/sbezugliy/smashing"
  spec.metadata["changelog_uri"] = "https://github.org/sbezugliy/smashing/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?("bin/", "test/", "spec/", "features/", ".git", ".circleci", "appveyor", "Gemfile")
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'faraday'
  spec.add_dependency 'nokogiri'

  spec.add_dependency 'dry-configurable'
  spec.add_dependency 'slop'
  spec.add_dependency 'faraday_middleware'
  
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "rubocop"

  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "rubocop-shopify"
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
