require_relative '../test_helper'

class URLTest < FeatureTest

  def test_create_and_find_source
    TrafficSpy::URL.create(Payload::DATA1["url"])
    assert TrafficSpy::URL.find("http://jumpstartlab.com/blog")
  end

  def test_add_creates_if_unique
    TrafficSpy::URL.add(Payload::DATA1["url"])
    assert_equal 1, TrafficSpy::URL.table.count
    TrafficSpy::URL.add(Payload::DATA1["url"])
    assert_equal 1, TrafficSpy::URL.table.count
    TrafficSpy::URL.add(Payload::DATA2["url"])
    assert_equal 2, TrafficSpy::URL.table.count
  end

  def test_can_retrieve_id
    TrafficSpy::URL.create(Payload::DATA1["url"])
    assert TrafficSpy::URL.find(Payload::DATA1["url"]).id
  end

  def test_can_find_longest_response_time
    source = TrafficSpy::Source.create("jumpstartlab", "jumpstartlab.com")
    url = "/about"
    TrafficSpy::URL.add(Payload::DATA4["url"])
    TrafficSpy::URL.add(Payload::DATA2["url"])
    assert_equal 32, TrafficSpy::URLsView.longest_response_time(source, url)
  end
end
