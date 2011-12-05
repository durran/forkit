# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "forkit/version"

Gem::Specification.new do |s|
  s.name        = "forkit"
  s.version     = Forkit::VERSION
  s.platform    = "java"
  s.authors     = ["Durran Jordan"]
  s.email       = ["durran@gmail.com"]
  s.homepage    = "http://github.com/durran/duke"
  s.summary     = "Process Array#each blocks concurrently with JDK7 ForkJoinPools."
  s.description = "Process Array#each blocks concurrently with JDK7 ForkJoinPools using JRuby."

  s.add_development_dependency("mocha", ["~> 0.9"])
  s.add_development_dependency("rspec", ["~> 2.7"])
  s.add_development_dependency("watchr", ["~> 0.6"])

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "forkit"
  s.files = Dir.glob("lib/**/*") + %w(LICENSE README.md Rakefile)
  s.require_path = "lib"
end
