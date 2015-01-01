module TrafficSpy
  class Payload

    def self.create(params, source_id)
        table.insert(
          :source_id     => Sources.find(params[:url]) || Sources.create(params[:url]).id,
          :url_id        => URL.find(params[:url]) || URL.create(params[:url]).id,
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
  end
end
