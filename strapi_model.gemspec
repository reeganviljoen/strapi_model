# frozen_string_literal: true

require_relative "lib/strapi_model/version"

Gem::Specification.new do |spec|
  spec.name = "strapi_model"
  spec.version = StrapiModel::VERSION
  spec.authors = ["reeganviljoen"]
  spec.email = ["reeganviljoen@outlook.com"]

  spec.summary = "Rails like models for Strapi."
  spec.description = "An ORM to interact with Strapi headless CMS in Ruby on Rails."
  spec.homepage = "https://github.com/reeganviljoen/strapi_model"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/reeganviljoen/strapi_model"
  spec.metadata["changelog_uri"] = "https://github.com/reeganviljoen/strapi_model/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "debug"
  spec.add_dependency "activesupport"
  spec.add_dependency "json"
  spec.add_dependency "http"
  spec.add_dependency "yard"
end
