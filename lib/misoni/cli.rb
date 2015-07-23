# coding: utf-8

require 'misoni'
require 'thor'

module Misoni
  class CLI < Thor
    include Thor::Actions
    package_name "Misoni"
    
    # https://github.com/machu/wifi_login/blob/master/lib/wifi_login/cli.rb#L9-L39
    LAUNCH_AGENT_DIR = "#{ENV['HOME']}/Library/LaunchAgents"
    LAUNCH_AGENT_FILE = "#{LAUNCH_AGENT_DIR}/com.neoneobeam.misoni.plist"
    LOG_DIR = "#{ENV['HOME']}/Library/Logs/com.neoneobeam.misoni"

    def self.source_root
      File.dirname(__FILE__)
    end

    desc "install", "Install trigger. (Only for Mac OS X)"
    def install
      empty_directory LOG_DIR
      if Misoni.in_rbenv?
        template "templates/com.neoneobeam.misoni.plist.rbenv.tt", "#{LAUNCH_AGENT_FILE}"
      else
        template "templates/com.neoneobeam.misoni.plist.tt", "#{LAUNCH_AGENT_FILE}"
      end
      run "launchctl load #{LAUNCH_AGENT_FILE}"
      say
      say 'Completed install. Please run `misoni config` or `pit set "http://auth.zokei.ac.jp:16978"` to set your ID/Password.', Thor::Shell::Color::GREEN
    end

    desc "uninstall", "Uninstall trigger."
    def uninstall
      run "launchctl unload #{LAUNCH_AGENT_FILE}"
      return unless File.exist?(LAUNCH_AGENT_FILE)
      remove_file LAUNCH_AGENT_FILE
    end
    
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