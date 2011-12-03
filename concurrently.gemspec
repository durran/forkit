# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "concurrently"

Gem::Specification.new do |s|
  s.name        = "concurrently"
  s.version     = "0.1.0"
  s.platform    = "java"
  s.authors     = ["Durran Jordan"]
  s.email       = ["durran@gmail.com"]
  s.homepage    = "http://github.com/durran/concurrently"
  s.summary     = "Process each blocks concurrently."
  s.description = "Process each blocks concurrently on the Java ForkJoinPool."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "concurrently"
  s.files        = Dir.glob("lib/**/*") + %w(LICENSE README.md Rakefile)
  s.require_path = "lib"
end
