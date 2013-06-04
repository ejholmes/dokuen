require 'fileutils'

module Dokuen
  class Application::Creator
    attr_reader :name

    def self.create(*args)
      new(*args).create
    end

    def initialize(name)
      @name = name
    end

    def create
      create_directories
      create_repository
    end

  private

    def create_directories
      FileUtils.mkdir_p(app_dir)
      dirs = [
        'releases',
        'env',
        'logs',
        'build'
      ].map { |dir| app_dir.join(dir) }
      FileUtils.mkdir_p(dirs)
    end

    def create_repository
      FileUtils.mkdir_p(repo_dir)
    end

    def repo
      "#{name}.git"
    end

    def repo_dir
      app_dir.join(repo)
    end

    def app_dir
      config.apps_dir.join(name)
    end

    def self.config
      Dokuen.config
    end

    def config
      self.class.config
    end

  end
end
