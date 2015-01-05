module TrafficSpy

  class URL
    attr_reader :id, :url

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
      URL.new(row) if row
    end

    private

    def self.not_created?(url)
      table.where(url: url).first == nil
    end

    def self.exists?(url)
      !table.where(url: url).empty?
    end

    def self.longest_response_time(source, url)
      url_id = URL.find(url).id
      DB.from(:payloads)
      .where(:source_id => source[:id])
      .where(:url_id => url_id)
      .max(:responded_in)
    end


    def self.shortest_response_time(source, url)
      url_id = URL.find(url).id
      DB.from(:payloads)
      .where(:source_id => source[:id])
      .where(:url_id => url_id)
      .min(:responded_in)
    end

    def self.average_response_time(source, url)
      url_id = URL.find(url).id
      DB.from(:payloads)
      .where(:source_id => source[:id])
      .where(:url_id => url_id)
      .avg(:responded_in).to_i
    end

    def self.http_verbs(source, url)
      url_id = URL.find(url).id
      DB.from(:payloads)
      .select_group(:requested_type)
      .where(:source_id => source[:id])
      .where(:url_id => url_id)
      .map { |row| row[:requested_type] }.join(", ")
    end

    def self.popular_referrers(source, url)
      url_id = URL.find(url).id
      DB.from(:payloads)
      .where(:source_id => source[:id])
      .where(:url_id => url_id)
      .join(:referred_by, :id => :referred_by_id)
      .group_and_count(:referred_by_id)
      .order(Sequel.desc(:count))
      .map { |row| ReferredBy.find_by_id(row[:referred_by_id]).referrer}.join(", ")
    end

    def self.popular_user_agents(source, url)
      url_id = URL.find(url).id
      DB.from(:payloads)
      .join(:user_agents, :id => :user_agent_id)
      .group_and_count(:browser, :os)
      .where(:source_id => source[:id])
      .where(:url_id => url_id)
      .order(Sequel.desc(:count))
      .map { |row| "#{row[:browser]} - #{row[:os]}"}.join(", ")
    end
  end
end
