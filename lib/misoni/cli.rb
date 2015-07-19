# coding: utf-8

require 'thor'
require 'mechanize'

module Disksizerec
  class CLI < Thor
    desc "auth", "authorize zokei network"
    def auth()
      agent = Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
        }

      agent.get('http://auth.zokei.ac.jp:16978/') do |page|
        login_result = page.forms do |form|
          form.name = ''
          form.pass = ''
        end.submit

        login_result.links.each do |link|
          puts link.text
        end
      end
    end
  end
end