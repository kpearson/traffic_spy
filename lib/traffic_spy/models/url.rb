module TrafficSpy
  class URL
    attr_reader :id

    def initialize(attributes)
      @id  = attributes[:id]
      @url = attributes[:url]
    end

    def self.table
      DB.from(:urls)
    end

    def self.add_new(url)
      create(url) if find_url(url).nil?
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

    def self.find_url(url)
      row = table.where(url: url).first
      URL.new(row) if row
    end
  end
end
