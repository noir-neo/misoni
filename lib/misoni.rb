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
  
  def self.isSuccess(page)
    body = Nokogiri::HTML(page.body)
    body.css('table tr:nth-child(2) td').each do |child|
      unless child.text.include?("成功")
        raise Misoni::Error.new("authentication failed")
      end
    end
  end
  
  def self.auth
    agent = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
      }
    
    begin
      agent.get('http://auth.zokei.ac.jp:16978/') do |page|
        login_result = page.form_with(:action => '/cgi-bin/adeflogin.cgi') do |form|
          config = getConfig
          form.field_with(:name => 'name').value = config["id"]
          form.field_with(:name => 'pass').value = config["password"]
        end.submit
        isSuccess(login_result)
      end
    rescue SocketError => e
      puts e.message
    end
  end
  
end
