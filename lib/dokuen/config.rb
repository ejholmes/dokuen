require 'yaml'

# Provides easy access to YAML configuration.
class Dokuen::Config
  def initialize(path)
    @path = path
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

  def config
    @config ||= YAML.load(File.read(path))
  end

end

