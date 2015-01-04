require_relative '../test_helper'

class ResolutionTest < FeatureTest

  def test_create_and_find_resolution
    TrafficSpy::Resolution.create(Payload::DATA1["resolutionWidth"], Payload::DATA1["resolutionHeight"])
    assert TrafficSpy::Resolution.find("1920 x 1280")
  end

  def test_add_creates_if_unique
    TrafficSpy::Resolution.add(Payload::DATA1["resolutionWidth"], Payload::DATA1["resolutionHeight"])
    assert_equal 1, TrafficSpy::Resolution.table.count
    TrafficSpy::Resolution.add(Payload::DATA1["resolutionWidth"], Payload::DATA1["resolutionHeight"])
    assert_equal 1, TrafficSpy::Resolution.table.count
    TrafficSpy::Resolution.add(Payload::DATA2["resolutionWidth"], Payload::DATA2["resolutionHeight"])
    assert_equal 2, TrafficSpy::Resolution.table.count
  end
end