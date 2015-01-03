module TrafficSpy

  class Resolution
    extend Utility
    attr_reader :id, :width, :height

    def initialize(attributes)
      @id       = attributes[:id]
      @width    = attributes[:width]
      @height   = attributes[:height]
    end

    def self.table
      DB.from(:resolutions)
    end

    def self.add(width, height)
      create(height, width) if not_created?(width, height)
    end

    def self.create(width, height)
      table.insert(
        :width  => width,
        :height => height
      )
    end

    def self.find_by_all_height(height)
      rows = table.where(height: height)
      rows.each { |row| Resolution.new(row) }
    end

    def self.find_all_by_width(width)
      rows = table.where(width: width)
      rows.each { |row| Resolution.new(row) }
    end

    private

    def self.not_created?(width, height)
      table.where(width: width).where(height: height).first == nil
    end
  end
end