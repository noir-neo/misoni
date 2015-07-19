# coding: utf-8

require 'thor'
require 'io/console'
require 'misoni'

module Misoni
  class CLI < Thor
    package_name "Misoni"
    
    desc "config", "setting config"
    def config
      Misoni.getConfig
    end
    
    desc "auth", "authorize zokei network"
    def auth
      Misoni.auth
    end
  end
end