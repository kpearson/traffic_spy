require_relative '../test_helper'

class URLTest < FeatureTest

  def test_create_and_find_source
    TrafficSpy::URL.create(Payload::DATA1["url"])
    assert TrafficSpy::URL.find("jumpstartlab.com")
  end

  def test_add_creates_if_unique
    skip
    TrafficSpy::URL.add(Payload::DATA1["url"])
    assert_equal 1, TrafficSpy::URL.table.count
    TrafficSpy::URL.add(Payload::DATA1["url"])
    assert_equal 1, TrafficSpy::URL.table.count
    TrafficSpy::URL.add(Payload::DATA2["url"])
    assert_equal 2, TrafficSpy::URL.table.count
  end
end
