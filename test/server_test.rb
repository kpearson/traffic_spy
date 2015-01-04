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

  def test_response_code_400_missing_or_incomplete_payload
    response = "400 Bad request\nPlease ensure payload data is correct."
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA3).to_json}"
    assert_equal 400, last_response.status
    assert_equal response, last_response.body
    post '/sources/jumpstartlabs/data'
    assert_equal 400, last_response.status
    assert_equal response, last_response.body
  end

  def test_response_code_400_missing_identifier_rooturl
    response = "400 Bad request\nPlease make sure all fields are filled out."
    post '/sources', { rootUrl: ""}
    assert_equal 400, last_response.status
    assert_equal response, last_response.body
    post '/sources'
    assert_equal 400, last_response.status
    assert_equal response, last_response.body
  end

  def test_route_403_forbidden_identifier_already_exists
    response = "403 Forbidden Identifier already exists."
    post '/sources', {identifier: "aa", rootUrl: "url"}
    assert last_response.ok?
    post '/sources', {identifier: "aa", rootUrl: "url"}
    assert_equal 403, last_response.status
    assert_equal response, last_response.body
  end

  def test_route_403_forbidden_already_received_request
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    assert last_response.ok?
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    assert_equal 403, last_response.status
    assert_equal "403 Forbidden Already received request.", last_response.body
  end

  def test_route_403_forbidden_application_not_registered
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    assert_equal 403, last_response.status
    assert_equal "403 Forbidden Application not registered.", last_response.body
    get '/sources/jumpstartlabs'
    assert_equal 403, last_response.status
    assert_equal "403 Forbidden Application not registered.", last_response.body
  end

  def test_payload_accepted_successfully
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    assert last_response.ok?
  end

  def test_route_source_view
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    get '/sources/jumpstartlabs'
    assert last_response.ok?
  end
end
