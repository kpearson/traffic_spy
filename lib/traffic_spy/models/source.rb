module TrafficSpy
  class Source
    def initialize(attributes)
      @id         = attributes[:id]
      @identifier = attributes[:identifier]
      @url_id     = attributes[:url_id]
    end

    def self.table
      DB.from(:sources)
    end

    def self.create(identifier, url_id)
      table.insert(
        :id         => next_id,
        :identifier => identifier,
        :url_id     => url_id
      )
    end

    def self.next_id
      table.count + 1
    end
  end
end
