require 'sinatra'
require 'capybara'

require_relative '../test_helper'
require_relative '../../lib/traffic_spy'

Capybara.app = TrafficSpy::Server

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    IdeaStore.delete_all
  end

#TODO move below to own file
  def assert_ok
    assert last_response.ok?,
    "Expected OK from this responses:\n#{last_response.inspect}"
  end

  def assert_page_has(content)
    assert last_response.body.include?(content),
    ["Expected this content:",
      content,
      "in this response body:",
      last_response.body.inspect].join("\n")
  end
end
