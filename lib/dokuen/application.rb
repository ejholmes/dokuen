require 'tmpdir'
require 'fileutils'
require 'pathname'
require 'time'

module Dokuen
  class Application
    autoload :Environment, 'dokuen/application/environment'

    attr_reader :name
    attr_reader :config

    def initialize(name, config)
      @name   = name
      @config = config
    end

    def self.create
    end

    def env
    end

    def deploy
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

  end
end
