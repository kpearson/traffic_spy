module TrafficSpy

  class ReferredBy
    attr_reader :id

    def initialize(attribute)
      @id = attribute[:id]
      @referrer = attribute[:referrer]
    end

    def self.table
      DB.from(:referred_by)
    end

    def self.add(referrer)
      create(referrer) if not_created?(referrer)
    end

    def self.create(referrer)
      table.insert(
      :referrer    => referrer
      )
    end

    def self.find(referrer)
      row = table.where(referrer: referrer).first
      ReferredBy.new(row)
    end

    private

    def self.not_created?(referrer)
      table.where(referrer: referrer).first == nil
    end
  end
end
