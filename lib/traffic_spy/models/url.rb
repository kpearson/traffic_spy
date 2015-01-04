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
      create(url) if not_created?(url)
    end

    def self.create(url)
        table.insert(
        :url    => url
      )
    end

    def self.find(url)
      row = table.where(url: url).first
      URL.new(row)
    end

    private

    def self.not_created?(url)
      table.where(url: url).first == nil
    end
  end
end
