require_relative '../test_helper'

class URLTest < Minitest::Test

  def test_create_and_find_source
    TrafficSpy::URL.create("jumpstartlab.com")
    assert TrafficSpy::URL.find("jumpstartlab.com")
  end

  def test_add_creates_if_unique
    TrafficSpy::URL.add("jumpstartlab.com")
    TrafficSpy::URL.add("jumpstartlab.com")
    TrafficSpy::URL.add("turing.com")
    assert_equal 2, TrafficSpy::URL.table.count
  end
end
