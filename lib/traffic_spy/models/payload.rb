require 'json'

module TrafficSpy
  class Payload
    attr_reader :id,
                :source_id,
                :url_id,
                :requested_at,
                :responded_in,
                :request_type,
                :parameters,
                :ip

    def initialize(attributes)
      @id = attributes[:id]
      @source_id = attributes[:source_id]
      @url_id = attributes[:url_id]
      @requested_at = attributes[:requested_at]
      @responded_in = attributes[:responded_in]
      @request_type = attributes[:request_type]
      @parameters = attributes[:parameters]
      @ip = attributes[:ip]
    end


    def self.create(params, source_id)
      params = payload_parser(params)
        table.insert(
          :source_id      => source_id,
          :url_id         => URL.add(URI(params["url"]).path),
          :requested_at   => params["requestedAt"],
          :responded_in   => params["respondedIn"],
          :referred_by_id => ReferredBy.add(params["referrer"]),
          :request_type   => params["requestType"],
          :parameters     => params["parameters"],
          :event_name_id  => Event.add(params["eventName"]),
          :user_agent_id  => UserAgent.add(params["userAgent"]),
          :resolution_id  => resolution_id,
          :ip             => params["ip"]
        )
    end

    def self.table
      DB.from(:payloads)
    end

    def self.payload_parser(params)
      JSON.parse(params)
    end
  end
end
