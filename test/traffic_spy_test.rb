class TrafficSpyTest < FeatureTest
  include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def test_find_all_source_urls
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA2).to_json}"
    assert_equal 2, TrafficSpy::SourceView.find_urls("jumpstartlabs").count
  end

  def test_find_all_source_urls
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA2).to_json}"
    assert_equal 2, TrafficSpy::SourceView.find_browsers("jumpstartlabs").count
  end

  def test_find_all_events
    TrafficSpy::Source.create("jumpstartlabs", "jumpstartlabs.com")
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA1).to_json}"
    post '/sources/jumpstartlabs/data', "payload=#{(Payload::DATA2).to_json}"
    assert_equal 2, TrafficSpy::EventsView.find_events("jumpstartlabs").count
  end
end
