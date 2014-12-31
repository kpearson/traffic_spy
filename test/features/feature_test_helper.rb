require 'sinatra'
require 'capybara'

require_relative "../test_helper"
require_relative '../../lib/traffic_spy.rb'

Capybara.app = TrafficSpy::Server

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    IdeaStore.delete_all
  end
end