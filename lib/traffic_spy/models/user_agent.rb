module Utility
  require 'useragent'
  class UserAgent < UserAgent
  end
end

module TrafficSpy

  class UserAgent
    extend Utility
    attr_reader :id, :data, :os, :browser

    def initialize(attributes)
      @id       = attributes[:id]
      @data     = attributes[:data]
      @os       = attributes[:os]
      @browser  = attributes[:browser]
    end

    def self.table
      DB.from(:user_agents)
    end

    def self.add(user_agent)
      create(user_agent) if not_created?(user_agent)
    end

    def self.browser_parser(user_agent)
      Utility::UserAgent.parse(user_agent).browser
    end

    def self.os_parser(user_agent)
      Utility::UserAgent.parse(user_agent).platform
    end

    def self.create(user_agent)
      table.insert(
        :data    => user_agent,
        :os      => os_parser(user_agent),
        :browser => browser_parser(user_agent)
      )
    end

    def self.find_by_os(user_agent_os)
      rows = table.where(os: user_agent_os)
      rows.each { |row| UserAgent.new(row) }
    end

    def self.find_all_by_browser(user_agent_browser)
      rows = table.where(browser: user_agent_browser)
      rows.each { |row| UserAgent.new(row) }
    end

    def self.find_by_data(user_agent)
      row = table.where(data: user_agent).first
      UserAgent.new(row)
    end

    private

    def self.not_created?(user_agent)
      table.where(data: user_agent).first == nil
    end
  end
end
