require_relative '../test_helper'

class PayloadTest < Minitest::Test

  def test_create_and_find_source
    TrafficSpy::Payload.create("jumpstartlab", "jumpstartlab.com")
    assert TrafficSpy::Payload.find("jumpstartlab")
  end
end
