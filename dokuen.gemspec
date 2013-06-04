$:.push File.expand_path("../lib", __FILE__)

require 'dokuen/version'

Gem::Specification.new do |gem|
  gem.name = 'dokuen'
  gem.version = Dokuen::VERSION
  gem.date = `date +%Y-%m-%d`

  gem.summary = 'A Personal Application Platform for Macs'
  gem.description = 'Like Heroku but Personal'

  gem.author = 'Pete Keen'
  gem.email = 'pete@bugsplat.info'

  gem.require_paths = %w< lib >

  gem.bindir        = 'bin'
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.test_files = gem.files.select {|path| path =~ /^test\/.*.rb/ }

  gem.add_dependency 'thor'
  gem.add_dependency 'mason',   '~> 0.1.0'
  gem.add_dependency 'foreman', '>= 0.63.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.homepage = 'https://github.com/peterkeen/dokuen'
end
