ENV["RACK_ENV"] = "test"

lib_dir = File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift(lib_dir)

require 'bundler'
Bundler.require
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'pry'
# require 'server'

# require 'time'
# require 'minitest/mock'

require_relative '../lib/traffic_spy'

