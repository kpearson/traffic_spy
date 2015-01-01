require_relative 'test_helper'

class ServerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def test_root_response_code_200
    get '/'
    assert_equal 200, last_response.status
  end

  def test_response_code_400
    post '/source', {identifier: "", rootUrl: ""}
    assert_equal 400, last_response.status
    refute last_response.ok?
    assert_equal "400 Bad request/n Please make sure all fields are filled out.", last_response.body
  end


  def test_response_code_400_with_missing_param
    post '/source', { rootUrl: ""}
    assert_equal 400, last_response.status
    refute last_response.ok?
    assert_equal "400 Bad request/n Please make sure all fields are filled out.", last_response.body
  end

  def test_response_code_403
    post '/source', {identifier: "aa", rootUrl: "url"}
    post '/source', {identifier: "aa", rootUrl: "url"}
    assert_equal 403, last_response.status
    refute last_response.ok?
  end

  def test_payload_accepted_successfully
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
    data.to_json
    post '/sources/jumpstartlabs/data'
    assert last_response.ok?
  end

end
