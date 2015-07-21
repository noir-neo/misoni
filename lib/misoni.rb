require "misoni/version"
require "misoni/cli"
require 'rubygems'
require 'nokogiri'
require 'mechanize'
require 'pit'

module Misoni
  class Error < StandardError; end
  
  def self.getConfig
    Pit.get("http://auth.zokei.ac.jp:16978", :require => { "id"=> "YOUR_UserID", "password"=> "YOUR_PASSWORD" })
  end
  def self.auth
    agent = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
      }
    
    begin
      agent.get('http://auth.zokei.ac.jp:16978/') do |page|
        login_result = page.form_with(:action => '/cgi-bin/adeflogin.cgi') do |form|
          config = Pit.get("http://auth.zokei.ac.jp:16978")
          form.field_with(:name => 'name').value = config["id"]
          form.field_with(:name => 'pass').value = config["password"]
        end.submit

        html = Nokogiri::HTML(login_result.body)
        html.css('table tr:nth-child(2) td').each do |child|
          p child.text
        end
      end
    rescue SocketError => e
      puts e.message
    end
  end
end
