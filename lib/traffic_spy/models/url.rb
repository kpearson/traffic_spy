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

    end

    def self.find(url)
      row = table.where(url: url).first
      URL.new(row) if row
    end
  end
end