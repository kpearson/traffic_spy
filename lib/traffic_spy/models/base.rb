module TrafficSpy

  if ENV["TRAFFIC_SPY_ENV"] == "test"
    DB = Sequel.postgres "traffic_spy_test"
  else
    DB = Sequel.postgres "traffic_spy"
  end

end

require 'traffic_spy/models/source'
require 'traffic_spy/models/payload'
require 'traffic_spy/models/url'
require 'traffic_spy/models/referred_by'
require 'traffic_spy/models/event'
require 'traffic_spy/models/user_agent'
require 'traffic_spy/models/resolution'