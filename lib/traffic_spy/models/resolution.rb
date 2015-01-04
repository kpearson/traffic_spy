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
      create(width, height) if not_created?(width, height)
    end

    def self.create(width, height)
      resolution = "#{width } x #{ height}"
      table.insert(
        :resolution  => resolution,
      )
    end

    def self.find(resolution)
      table.where(resolution: resolution).first
    end

    private

    def self.not_created?(width, height)
      resolution = "#{width } x #{ height}"
      table.where(resolution: resolution).first == nil
    end
  end
end