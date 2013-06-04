require 'pathname'

module Dokuen
  class Application::Environment < Hash
    attr_reader :base

    def initialize(base, *args)
      super(*args)
      @base = Pathname(base)
      replace(env)
    end

    def []=(key, value)
      base.join(key).open('w') do |f|
        f.write super
      end
    end

    def delete(key)
      base.join(key).unlink
      super
    end

  private

    def env
      @env ||= Dir.glob("#{base}/*").inject({}) do |hash, key|
        hash[File.basename(key)] = File.read(key).chomp
        hash
      end
    end

  end
end
