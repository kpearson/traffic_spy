module TrafficSpy
  class Source

    def initialize(attributes)
      # @id         = attributes[:id]
      @identifier = attributes[:identifier]
      @root_url   = attributes[:url_id]
    end

    def self.table
      DB.from(:sources)
    end

    def self.add(identifier, root_url)
      create(identifier, root_url) if find(identifier).nil?
    end

    def self.find(url)
      table.where(url: url).first
      # Source.new(row)
    end

    # def self.next_id
    #   table.count + 1
    # end

    def self.create(identifier, root_url)
      begin
        table.insert(
          # :id          => next_id,
          :identifier  => identifier,
          :root_url    => root_url
        )
        rescue Sequel::UniqueConstraintViolation
        return false
      end
    end
  end
end
