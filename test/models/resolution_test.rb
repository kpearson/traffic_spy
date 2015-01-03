require_relative '../test_helper'

class Resolution < FeatureTest

  def test_create_and_find_user_agent
    TrafficSpy::Resolution.create(Payload::DATA1["Resolution"])
    assert TrafficSpy::Resolution.find_by_data("Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17")
  end

  def test_add_creates_if_unique
    TrafficSpy::Resolution.add(Payload::DATA1["Resolution"])
    assert_equal 1, TrafficSpy::Resolution.table.count
    TrafficSpy::Resolution.add(Payload::DATA1["Resolution"])
    assert_equal 1, TrafficSpy::Resolution.table.count
    TrafficSpy::Resolution.add(Payload::DATA2["Resolution"])
    assert_equal 2, TrafficSpy::Resolution.table.count
  end

  def test_find_all_by_os
    TrafficSpy::Resolution.create(Payload::DATA1["Resolution"])
    assert TrafficSpy::Resolution.find_by_os("Macintosh%3B Intel Mac OS X 10_5_2")
  end

  def test_find_all_by_browser
    TrafficSpy::Resolution.create(Payload::DATA1["Resolution"])
    TrafficSpy::Resolution.create(Payload::DATA2["Resolution"])
    assert_equal 2, TrafficSpy::Resolution.find_all_by_browser("Chrome").count
  end

  def test_agent_parser
    user_agent = Payload::DATA1["Resolution"]
    browser = TrafficSpy::Resolution.agent_parser(user_agent, "browser")
    assert_equal "Chrome", browser
  end
end