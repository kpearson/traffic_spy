require 'sinatra/base'
require 'sequel'
require 'better_errors'

require 'traffic_spy/models/base'
require 'traffic_spy/server'

require "traffic_spy/version"

module TrafficSpy

  class SourceView
    # def self.source(identifier)
    #   source = Source.find(identifier)
    #   Payload.find_by_source_id(source[:id]) #returns array of hashes
    # end

    def self.find_urls(identifier)
      source = TrafficSpy::Source.find(identifier)
      TrafficSpy::Payload.find_urls(source[:id])
    end

    def self.find_browsers(identifier)
      source = TrafficSpy::Source.find(identifier)
      TrafficSpy::Payload.find_browsers(source[:id])
    end

    def self.find_all_os(identifier)
      source = TrafficSpy::Source.find(identifier)
      TrafficSpy::Payload.find_all_os(source[:id])
    end

    # def self.find_resolutions(identifier)
    #   source = TrafficSpy::Source.find(identifier)
    #   require 'pry' ; binding.pry
    #   TrafficSpy::Payload.find_resolutions(source[:id])
    # end
  end

  class EventsView
    def self.find_events(identifier)
      TrafficSpy::Payload.find_events(identifier)
    end
  end

  class URLsView
    def self.longest_response_time(identifier, url)
      source = TrafficSpy::Source.find(identifier)
      TrafficSpy::URL.longest_response_time(source, url)
    end
  end
end
