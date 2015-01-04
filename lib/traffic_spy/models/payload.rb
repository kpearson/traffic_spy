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
      @id           = attributes[:id]
      @source_id    = attributes[:source_id]
      @url_id       = attributes[:url_id]
      @requested_at = attributes[:requested_at]
      @responded_in = attributes[:responded_in]
      @request_type = attributes[:requested_type]
      @parameters   = attributes[:parameters]
      @ip           = attributes[:ip]
    end


    def self.create(params, source_id)
      params = payload_parser(params)
      table.insert(
        :source_id      => source_id,
        :url_id         => URL.add(URI(params["url"]).path),
        :requested_at   => params["requestedAt"],
        :responded_in   => params["respondedIn"],
        :referred_by_id => ReferredBy.add(params["referrer"]),
        :requested_type => params["requestType"],
        :parameters     => params.to_json,
        :event_id       => Event.add(params["eventName"]),
        :user_agent_id  => UserAgent.add(params["userAgent"]),
        :resolution_id  => Resolution.add(params["resolutionWidth"], params["resolutionHeight"]),
        :ip             => params["ip"]
      )
    end

    def self.table
      DB.from(:payloads)
    end

    def self.payload_parser(payload)
      JSON.parse(payload)
    end

    def self.find_by_source_id(source)
      table.where(source_id: source)
    end

    def self.unique_payload?(payload)
      table.where(parameters: payload).first == nil
    end

    def self.valid?(payload)
      params = payload_parser(payload)
      if unique_payload?(payload) &&
        params["url"] &&
        params["requestedAt"] &&
        params["respondedIn"] &&
        params["referredBy"] &&
        params["requestType"] &&
        params["parameters"] &&
        params["eventName"] &&
        params["userAgent"] &&
        params["resolutionWidth"] &&
        params["resolutionHeight"] &&
        params["ip"]
        true
      else
        false
      end
    end
  end
end

