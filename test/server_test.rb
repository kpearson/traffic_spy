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

  def test_response_code_403
    post '/source', {identifier: "aa", rootUrl: "url"}
    post '/source', {identifier: "aa", rootUrl: "url"}
    assert_equal 403, last_response.status
    refute last_response.ok?
  end

end