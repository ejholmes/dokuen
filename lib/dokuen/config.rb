require 'yaml'
require 'pathname'

# Provides easy access to YAML configuration.
module Dokuen
  class Config
    def initialize(path)
      @path = path
    end

    def env_dir
      dokuen_dir.join('env')
    end

    def apps_dir
      dokuen_dir.join('apps')
    end

    def ports_dir
      dokuen_dir.join('ports')
    end

    def bin_dir
      dokuen_dir.join('bin')
    end

    def repos_dir
      dokuen_dir.join('repos')
    end

    def keys_dir
      dokuen_dir.join('keys')
    end

    def dokuen_dir
      Pathname(config['dokuen_dir'])
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
