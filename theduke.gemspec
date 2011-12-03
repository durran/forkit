# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "duke"

Gem::Specification.new do |s|
  s.name        = "theduke"
  s.version     = Duke::VERSION
  s.platform    = "java"
  s.authors     = ["Durran Jordan"]
  s.email       = ["durran@gmail.com"]
  s.homepage    = "http://github.com/durran/duke"
  s.summary     = "Process Array#each blocks concurrently with JDK7 ForkJoinPools."
  s.description = "Process Array#each blocks concurrently with JDK7 ForkJoinPools."

  s.required_rubygems_version = ">= 1.3.6"
  s.files = Dir.glob("lib/**/*") + %w(LICENSE README.md Rakefile)
  s.require_path = "lib"
end
