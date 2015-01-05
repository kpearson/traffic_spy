require_relative '../test_helper'

class PayloadTest < FeatureTest

  def before
    @source = TrafficSpy::Source.create("jumpstartlab", "jumpstartlab.com")
  end

  def test_create_and_find_source_id
    assert TrafficSpy::Payload.find_by_source_id(@source)
  end

  def test_create_requested_at
    # source = TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    # TrafficSpy::Payload.create(Payload::DATA1.to_json, source)
    # assert_equal "2013-02-16 21:38:28 -0700", TrafficSpy::Payload.find("jumpstartlabs").requested_at
  end

  def test_it_can_determine_if_payload_is_valid?
    assert TrafficSpy::Payload.valid?(Payload::DATA1.to_json)
    refute TrafficSpy::Payload.valid?(Payload::DATA3.to_json)
  end

  def test_unique_payload?
    TrafficSpy::Payload.create(Payload::DATA1.to_json, @source)
    refute TrafficSpy::Payload.unique?(Payload::DATA1.to_json)
  end

  def test_can_find_all_urls_by_source_id
    TrafficSpy::Payload.create(Payload::DATA1.to_json, @source)
    TrafficSpy::Payload.create(Payload::DATA2.to_json, @source)
    TrafficSpy::Payload.create(Payload::DATA4.to_json, @source)
    assert_equal 2, TrafficSpy::Payload.find_urls(@source).count
  end

  def test_can_find_all_browsers_by_source_id
    source_id = TrafficSpy::Source.create("jumpstartlab", "jumpstartlab.com")
    TrafficSpy::Payload.create(Payload::DATA1.to_json, source_id)
    TrafficSpy::Payload.create(Payload::DATA2.to_json, source_id)
    TrafficSpy::Payload.create(Payload::DATA4.to_json, source_id)
    assert_equal 2, TrafficSpy::Payload.find_browsers(source_id).count
  end
end
