$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require File.expand_path("../lib/the-board/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name = "the-board"
  spec.version = TheBoard::VERSION
  spec.authors = ["bugcloud"]
  spec.email = ["bugcloudisco@bugcloud.com"]

  spec.description = "The unofficial API client library for board. https://developers.the-board.jp/"
  spec.summary = spec.description
  spec.homepage = ""
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.files = Dir.glob("{lib}/**/*")
  spec.files += %w[the-board.gemspec LICENSE README.md Rakefile]
  spec.executables = "the-board"
  spec.require_paths = ["lib"]
end
