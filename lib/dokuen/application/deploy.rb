module Dokuen
  class Application::Deploy
    extend Forwardable

    attr_reader :application

    def_delegators :application,
      :directory,
      :env

    def self.deploy(*args)
      new(*args).deploy
    end

    def initialize(application)
      @application = application
    end

    def deploy
      build
    end

  private

    def build
    end

    def buildpack
      env['BUILDPACK_URL']
    end

    def release_dir
      "releases/#{Time.now.utc.strftime('%Y%m%dT%H%M%S')}"
    end

    def self.config
      Dokuen.config
    end

    def config
      self.class.config
    end

  end
end
