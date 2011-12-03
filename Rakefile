require "bundler"
Bundler.setup

require "rake"
require "rspec"
require "rspec/core/rake_task"
require "duke/version"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

task :gem => :build
task :build do
  system "gem build theduke.gemspec"
end

task :install => :build do
  system "sudo gem install theduke-#{Duke::VERSION}.gem"
end

task :release => :build do
  system "git tag -a v#{Duke::VERSION} -m 'Tagging #{Duke::VERSION}'"
  system "git push --tags"
  system "gem push theduke-#{Duke::VERSION}-java.gem"
end

RSpec::Core::RakeTask.new("spec") do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
