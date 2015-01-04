module TrafficSpy

  class Event
    attr_reader :id

    def initialize(attribute)
      @id = attribute[:id]
      @event = attribute[:event]
    end

    def self.table
      DB.from(:events)
    end

    def self.add(event)
      create(event) if not_created?(event)
    end

    def self.create(event)
      table.insert(
      :event    => event
      )
    end

    def self.find(event)
      row = table.where(event: event).first
      Event.new(row)
    end

    private

    def self.not_created?(event)
      table.where(event: event).first == nil
    end
  end
end
