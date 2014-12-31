module TrafficSpy

  class Event
    attr_reader :id

    def initialize(attribute)
      @id = attribute[:id]
      @name = attribute[:name]
    end

    def self.table
      DB.from(:event)
    end

    def self.add(event)
      create(event) if find(event).nil?
      find(event)
    end

    def self.find(event)
      row = table.where(event: event).first
      Event.new(row) if row

    end
  end
end
