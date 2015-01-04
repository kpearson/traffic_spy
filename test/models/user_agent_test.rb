require_relative '../test_helper'

class UserAgentTest < FeatureTest

  def test_create_and_find_user_agent
    TrafficSpy::UserAgent.create(Payload::DATA1["userAgent"])
    assert TrafficSpy::UserAgent.find_by_data("Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17")
  end

  def test_add_creates_if_unique
    TrafficSpy::UserAgent.add(Payload::DATA1["userAgent"])
    assert_equal 1, TrafficSpy::UserAgent.table.count
    TrafficSpy::UserAgent.add(Payload::DATA1["userAgent"])
    assert_equal 1, TrafficSpy::UserAgent.table.count
    TrafficSpy::UserAgent.add(Payload::DATA2["userAgent"])
    assert_equal 2, TrafficSpy::UserAgent.table.count
  end

  def test_find_all_by_browser
    TrafficSpy::UserAgent.create(Payload::DATA1["userAgent"])
    TrafficSpy::UserAgent.create(Payload::DATA2["userAgent"])
    assert_equal 2, TrafficSpy::UserAgent.find_all_by_browser("Chrome").count
  end

  def test_agent_parser
    user_agent = Payload::DATA1["userAgent"]
    browser = TrafficSpy::UserAgent.browser_parser(user_agent)
    assert_equal "Chrome", browser
  end

  def test_find_by_os
    TrafficSpy::UserAgent.create(Payload::DATA1["userAgent"])
    assert TrafficSpy::UserAgent.find_by_os("Macintosh%3B Intel Mac OS X 10_8_2")
  end
end