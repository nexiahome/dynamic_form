# frozen_string_literal: true

$LOAD_PATH.append File.expand_path("lib", __dir__)

Gem::Specification.new do |spec|
  spec.name = "dynamic_form"
  spec.version = "1.3.0"
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Joel Moss"]
  spec.email = ["joel@developwithstyle.com"]
  spec.homepage = "http://codaset.com/joelmoss/dynamic-form"
  spec.summary = "DynamicForm holds a few helper methods to help you deal with your Rails3 models"
  spec.license = "MIT"

  spec.add_dependency "rails", "~> 5.0"
  spec.add_development_dependency "mocha", "~> 0.9"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "test-unit", "~> 3.3"

  spec.files = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.require_paths = ["lib"]
end
