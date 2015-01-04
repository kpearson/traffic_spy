require_relative 'test_helper'

class ServerTest < FeatureTest
  include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def test_root_response_code_200
    get '/'
    assert_equal 200, last_response.status
  end

  def test_response_code_400
    responce = "400 Bad request\n Please make sure all fields are filled out."
               " and each of your data submitions is unique."
    post '/sources', {identifier: "", rootUrl: ""}
    assert_equal 400, last_response.status
    refute last_response.ok?
    assert_equal responce, last_response.body
  end


  def test_response_code_400_with_missing_param
    responce = "400 Bad request\n Please make sure all fields are filled out."
    post '/sources', { rootUrl: ""}
    assert_equal 400, last_response.status
    refute last_response.ok?
    assert_equal responce, last_response.body
  end

  def test_response_code_403
    post '/sources', {identifier: "aa", rootUrl: "url"}
    post '/sources', {identifier: "aa", rootUrl: "url"}
    assert_equal 403, last_response.status
    refute last_response.ok?
  end

  def test_payload_accepted_successfully
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    assert last_response.ok?
  end

  def test_response_code_400_for_payload
    responce = "400 Bad request\n Please make sure all fields are filled out."
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA3).to_json}"
    assert_equal 400, last_response.status
    refute last_response.ok?
    assert_equal responce, last_response.body
  end

end
