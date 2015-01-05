module TrafficSpy
  class Source
    attr_reader :id, :identifier, :root_url

    def initialize(attributes)
      @id         = attributes[:id]
      @identifier = attributes[:identifier]
      @root_url   = attributes[:root_url]
    end

    def self.table
      DB.from(:sources)
    end

    def self.add(identifier, root_url)
      create(identifier, root_url) if find(identifier).nil?
    end

    def self.find(identifier)
      table.where(identifier: identifier).first
      # Source.new(row)
    end

    def self.create(identifier, root_url)
      begin
        table.insert(
          :identifier  => identifier,
          :root_url    => root_url
        )
        rescue Sequel::UniqueConstraintViolation
        return false
      end
    end

    # def self.not_created?(identifier)
    #   table.where(identifier: identifier).first == nil
    # end

  end
end
