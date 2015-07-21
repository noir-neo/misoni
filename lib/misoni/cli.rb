# coding: utf-8

require 'misoni'
require 'thor'

module Misoni
  class CLI < Thor
    package_name "Misoni"
    
    desc "config", "setting config"
    def config
      Misoni.config
    end
    
    desc "auth", "authorize zokei network"
    def auth
      success = Misoni.auth
      say 'Succeeded', Thor::Shell::Color::GREEN if success
    end
    
    desc "version", "Prints the bundler's version information"
    def version
      say "misoni #{Misoni::VERSION}"
    end
    map %w(-v --version) => :version
  end
end