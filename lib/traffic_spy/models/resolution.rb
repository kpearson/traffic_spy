module TrafficSpy

  class Resolution
    attr_reader :id, :resolution

    def initialize(attributes)
      @id         = attributes[:id]
      @resolution = attributes[:resolution]
    end

    def self.table
      DB.from(:resolutions)
    end

    def self.add(width, height)
      if not_created?(width, height)
        create(width, height)
      else
        resolution = "#{width } x #{ height}"
        self.find(resolution).id
      end
    end

    def self.create(width, height)
      resolution = "#{width } x #{ height}"
      table.insert(
        :resolution  => resolution
      )
    end

    def self.find(resolution)
      row = table.where(resolution: resolution).first
      Resolution.new(row)
    end

    private

    def self.not_created?(width, height)
      resolution = "#{width } x #{ height}"
      table.where(resolution: resolution).first == nil
    end
  end
end
