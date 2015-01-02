module TrafficSpy

  class UserAgent
    attr_reader :id, :data, :os, :browser

    def initialize(attributes)
      @id       = attributes[:id]
      @data     = attribute_parser(attributes, data)
      @os       = attribute_parser(attributes, os)
      @browser  = attribute_parser(attributes, user_agent)
    end

    def self.table
      DB.from(:user_agents)
    end

    def self.add(user_agent)
      create(user_agent) if not_created?(user_agent)
    end

    def self.create(user_agent)
      table.insert(
      :user_agent    => user_agent
      )
    end

    def self.find(user_agent)
      row = table.where(user_agent: user_agent).first
      UserAgent.new(row)
    end

    private

    def self.attribute_parser(atters, type)
      attributes = UserAgent.parse(atters)
      attributes.type
    end

    def self.not_created?(user_agent)
      table.where(user_agent: user_agent).first == nil
    end
  end
end
