require 'sinatra/base'
require 'sequel'
require 'better_errors'

require 'traffic_spy/models/base'
require 'traffic_spy/server'

require "traffic_spy/version"

module TrafficSpy

  class SourceView
    def self.source_payloads(identifier)
      source = Source.find(identifier)
      Payload.find_by_source_id(source[:id]) #returns array of hashes
    end

    def self.find_urls(identifier)
      TrafficSpy::Payload.find_urls(identifier)
    end

  end

  class EventsView
    def self.find_events(identifier)
      TrafficSpy::Payload.find_events(identifier)
    end
  end
end
