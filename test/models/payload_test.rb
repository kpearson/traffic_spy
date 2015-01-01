require_relative '../test_helper'

class PayloadTest < Minitest::Test

  def test_create_and_find_source_id
    data = {"url" => "http://jumpstartlab.com/blog",
      "requestedAt" => "2013-02-16 21:38:28 -0700",
      "respondedIn" => 37,
      "referredBy" => "http://jumpstartlab.com",
      "requestType" => "GET",
      "parameters" => [],
      "eventName" => "socialLogin",
      "userAgent" => "Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
      "resolutionWidth" => "1920",
      "resolutionHeight" => "1280",
      "ip" => "63.29.38.211"}
    data = data.to_json
    TrafficSpy::Payload.create(data, "jumpstartlabs")
    assert TrafficSpy::Payload.find("jumpstartlabs")
  end
end
