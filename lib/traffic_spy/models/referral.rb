module TrafficSpy

  class Referral
    attr_reader :id

    def initialize(attribute)
      @id = attribute[:id]
      @referrer = attribute[:referrer]
    end

    def self.table
      DB.from(:referrer)
    end

    def self.add(referrer)
      create(referrer) if find(referrer).nil?
    end


    def self.create(referrer)
      table.insert(
      :id     => next_id,
      :referrer    => referrer
      )
    end

    def self.next_id
      table.count + 1
    end

    def self.find(refferer)
      row = table.where(referrer: referrer).first
      Referral.new(row) if row
    end
  end

  def self.next_id
    table.count + 1
  end
end
