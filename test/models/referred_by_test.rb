require_relative '../test_helper'

class ReferredByTest < FeatureTest

  def test_create_and_find_referrer
    TrafficSpy::ReferredBy.create(Payload::DATA1["referredBy"])
    assert TrafficSpy::ReferredBy.find("http://jumpstartlab.com")
  end

  def test_add_creates_if_unique
    TrafficSpy::ReferredBy.add(Payload::DATA1["referredBy"])
    assert_equal 1, TrafficSpy::ReferredBy.table.count
    TrafficSpy::ReferredBy.add(Payload::DATA1["referredBy"])
    assert_equal 1, TrafficSpy::ReferredBy.table.count
    TrafficSpy::ReferredBy.add(Payload::DATA2["referredBy"])
    assert_equal 2, TrafficSpy::ReferredBy.table.count
  end

  def test_can_retrieve_id
    TrafficSpy::ReferredBy.create(Payload::DATA1["referredBy"])
    assert TrafficSpy::ReferredBy.find(Payload::DATA1["referredBy"]).id
  end
end
