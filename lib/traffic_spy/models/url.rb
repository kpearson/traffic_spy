module TrafficSpy

  class URL
    attr_reader :id

    def initialize(attribute)
      @id = attribute[:id]
      @url = attribute[:url]
    end

    def self.table
      DB.from(:urls)
    end

    def self.create(url)
        table.insert(
        :id     => next_id,
        :url    => url
      )
    end

    def self.next_id
      table.count + 1
    end

    def self.find(url)
      require 'pry' ; binding.pry
      table.where(url: url).first
      # Source.new(row)
    end
  end
end
