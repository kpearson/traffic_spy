require_relative '../test_helper'

class PayloadTest < FeatureTest

  def test_create_and_find_source_id
    TrafficSpy::Payload.create(Payload::DATA1.to_json, "jumpstartlabs")
    assert TrafficSpy::Payload.find("jumpstartlabs")
  end

  def test_create_requested_at
    TrafficSpy::Payload.create(Payload::DATA1.to_json, "jumpstartlabs")
    # assert_equal "2013-02-16 21:38:28 -0700", TrafficSpy::Payload.find("jumpstartlabs").requested_at
  end
end
