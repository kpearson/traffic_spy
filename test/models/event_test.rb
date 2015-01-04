require_relative '../test_helper'

class EventTest < FeatureTest

  def test_create_and_find_resolution
    TrafficSpy::Event.create(Payload::DATA1["eventName"])
    assert TrafficSpy::Event.find("socialLogin")
  end

  def test_add_creates_if_unique
    TrafficSpy::Event.add(Payload::DATA1["eventName"])
    assert_equal 1, TrafficSpy::Event.table.count
    TrafficSpy::Event.add(Payload::DATA1["eventName"])
    assert_equal 1, TrafficSpy::Event.table.count
    TrafficSpy::Event.add(Payload::DATA2["eventName"])
    assert_equal 2, TrafficSpy::Event.table.count
  end
end