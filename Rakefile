require "bundler"
Bundler.setup

require "rake"
require "rspec"
require "rspec/core/rake_task"
require "concurrent/version"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

task :gem => :build
task :build do
  system "gem build concurrently.gemspec"
end

task :install => :build do
  system "sudo gem install concurrently-#{Concurrent::VERSION}.gem"
end

task :release => :build do
  system "git tag -a v#{Concurrent::VERSION} -m 'Tagging #{Concurrent::VERSION}'"
  system "git push --tags"
  system "gem push concurrently-#{Concurrent::VERSION}-java.gem"
end

RSpec::Core::RakeTask.new("spec") do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
