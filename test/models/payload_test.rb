require_relative '../test_helper'

class PayloadTest < FeatureTest

  def test_create_and_find_source_id
    TrafficSpy::Payload.create(Payload::DATA1.to_json, "jumpstartlabs")
    assert TrafficSpy::Payload.find("jumpstartlabs")
  end
end
