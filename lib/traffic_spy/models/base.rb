module TrafficSpy

  if ENV["TRAFFIC_SPY_ENV"] == "test"
    DB = Sequel.postgres "traffic_spy_test"
  else
    DB = Sequel.postgres "traffic_spy"
  end

end

#
# Require all the files within the model directory here...
#
# @example
#
require 'traffic_spy/models/source'
require 'traffic_spy/models/payload'
# require 'traffic_spy/models/url'
