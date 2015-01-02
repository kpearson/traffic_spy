require_relative '../test_helper'

class SourceTest < FeatureTest

  def test_create_and_find_source
    TrafficSpy::Source.create("jumpstartlab", "jumpstartlab.com")
    assert TrafficSpy::Source.find("jumpstartlab")
  end

  def test_add_creates_if_unique
    TrafficSpy::Source.add("jumpstartlab", "jumpstartlab.com")
    assert_equal 1, TrafficSpy::Source.table.count
    TrafficSpy::Source.add("jumpstartlab", "jumpstartlab.com")
    TrafficSpy::Source.add("turing", "turing.com")
    assert_equal 2, TrafficSpy::Source.table.count
  end
end
