$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "dokuen/version"
require 'rake'

task :default => [:spec]

def sys(cmd)
  system(cmd) or raise "Error running #{cmd}"
end

task :build do
  sys "gem build dokuen.gemspec"
end
 
task :release => :build do
  sys "git tag -a -m 'tag version #{Dokuen::VERSION}' v#{Dokuen::VERSION}"
  sys "git push origin master --tags"
  sys "git push github master --tags"
  sys "gem push dokuen-#{Dokuen::VERSION}.gem"
end

require 'rspec/core/rake_task'
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
