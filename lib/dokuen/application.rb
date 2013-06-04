require 'tmpdir'
require 'fileutils'
require 'pathname'
require 'time'

module Dokuen
  class Application
    extend Forwardable

    autoload :Environment, 'dokuen/application/environment'
    autoload :Creator,     'dokuen/application/creator'
    autoload :Deploy,      'dokuen/application/deploy'

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def self.create(name)
      raise ApplicationExistsError, "Application #{name} exists!" if exists?(name)
      Creator.create(name)
    end

    def self.exists?(name)
      config.apps_dir.join(name).exists?
    end

    def env
      Environment.new(config.env_dir)
    end

    def deploy
      Deploy.deploy(self)
    end

    def scale
    end

    def shutdown
    end

    def restart
    end

    def run(command)
    end

    def write_nginx_config
    end

    def clean
    end

    def directory
      config.apps_dir.join(name)
    end

  private
    
    def self.config
      Dokuen.config
    end

    def config
      self.class.config
    end

    def with(directory)
      Dir.chdir(directory) do
        yield
      end
    end

    def current_release
      directory.join('current').readlink
    end

  end
end
