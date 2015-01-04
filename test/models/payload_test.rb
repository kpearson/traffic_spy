require_relative '../test_helper'

class PayloadTest < FeatureTest

  def test_create_and_find_source_id
    source = TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    TrafficSpy::Payload.create(Payload::DATA1.to_json, source)
    assert TrafficSpy::Payload.find_by_source_id(source)
  end

  def test_create_requested_at
    # source = TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    # TrafficSpy::Payload.create(Payload::DATA1.to_json, source)
    # assert_equal "2013-02-16 21:38:28 -0700", TrafficSpy::Payload.find("jumpstartlabs").requested_at
  end

  def test_it_can_determine_if_payload_is_invalid
    refute TrafficSpy::Payload.invalid?(Payload::DATA3.to_json)
  end
end