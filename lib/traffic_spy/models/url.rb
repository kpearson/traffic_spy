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

    def self.add(url)
      create(url) if find(url).nil?
    end

    def self.create(url)
      # require 'pry' ; binding.pry
        DB.from(:urls).insert(
        :url    => url
      )
    end

    def self.find(url)
      table.where(url: url).first
      # Source.new(row)
    end
  end
end
