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
      puts 'Todo'
    end
  end
end
