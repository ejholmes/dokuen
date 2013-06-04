require 'yaml'

# Provides easy access to YAML configuration.
module Dokuen
  class Config
    def initialize(path)
      @path = path
    end

    def env_dir
    end

    def apps_dir
    end

    def ports_dir
    end

    def bin_dir
    end

    def repos_dir
    end

    def keys_dir
    end

    def method_missing(meth, *args, &block)
      meth = meth.to_s
      if config.has_key? meth
        config[meth]
      else
        super
      end
    end

  private
    attr_reader :path

    def directory(dir)
      File.join(dokuen_dir, dir)
    end

    def config
      @config ||= YAML.load(File.read(path))
    end
  end
end
