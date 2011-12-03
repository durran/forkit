require "bundler"
Bundler.setup

require "rake"
require "rspec"
require "rspec/core/rake_task"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

VERSION = "0.1.0"

task :gem => :build
task :build do
  system "gem build concurrently.gemspec"
end

task :install => :build do
  system "sudo gem install concurrently-#{VERSION}.gem"
end

task :release => :build do
  system "git tag -a v#{VERSION} -m 'Tagging #{VERSION}'"
  system "git push --tags"
  system "gem push concurrently-#{VERSION}-java.gem"
end

RSpec::Core::RakeTask.new("spec") do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
