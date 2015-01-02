require 'json'

module TrafficSpy
  class Payload

    def self.create(params, source_id)
      params = payload_parser(params)
        table.insert(
          :source_id     => source_id,
          :url_id        => URL.add(URI(params["url"]).path),
          :requestedAt   => requestedAt,
          :respondedIn   => respondedIn,
          :referredBy_id => referredBy_id,
          :requestType   => requestType,
          :parameters    => parameters,
          :eventName_id  => eventName_id,
          :userAgent_id  => userAgent_id,
          :resolution_id => resolution_id,
          :ip            => ip
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
