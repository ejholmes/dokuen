module Dokuen
  class Application::Deploy
    attr_reader :application

    def self.deploy(*args)
      new(*args).deploy
    end

    def initialize(application)
      @application = application
    end

    def deploy
      puts 'Todo'
    end
  
  end
end
