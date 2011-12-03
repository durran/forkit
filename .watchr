# vim:set filetype=ruby:
trap "INT" do
  start_fresh "Done running tests."
  exit! 0
end

def run_spec(file)
  return unless file.include?(" ") || File.exist?(file)
  start_fresh "Running specs..."
  system("time rspec --fail-fast -c #{file}")
end

def start_fresh(text=nil)
  print `clear`
  puts text if text
end

watch("^lib/(.*)\.rb") {|md| run_spec("spec/lib/#{md[1]}_spec.rb") }
watch("^spec/.*_spec\.rb") {|md| run_spec(md[0]) }
