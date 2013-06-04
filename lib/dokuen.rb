require "erb"

module Dokuen
  autoload :CLI,         'dokuen/cli'
  autoload :Config,      'dokuen/config'
  autoload :Application, 'dokuen/application'
  autoload :Wrapper,     'dokuen/wrapper'
  autoload :Platform,    'dokuen/platform'
  autoload :Keys,        'dokuen/keys'
  autoload :Shell,       'dokuen/shell'

  def self.template(name, bind)
    path = File.expand_path("../../data/templates/#{name}.erb", __FILE__)
    if File.exists?(path)
      t = ERB.new(File.read(path))
      t.result(bind)
    else
      raise "Unknown template: #{name}"
    end
  end
end
