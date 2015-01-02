ENV["RACK_ENV"] = "test"
ENV["TRAFFIC_SPY_ENV"] = "test"

lib_dir = File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift(lib_dir)

require 'bundler'
Bundler.require
require 'minitest/autorun'
require 'database_cleaner'
require 'minitest/pride'
require 'minitest/mock'
require 'rack/test'
require 'pry'

require_relative '../lib/traffic_spy'
require_relative './fixtures/payload_data'

module CleanTheDatabase
  DatabaseCleaner.strategy=(:truncation)

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

class Minitest::Test
  include CleanTheDatabase
end

class FeatureTest < MiniTest::Test
  include Rack::Test::Methods
  include Payload
end
