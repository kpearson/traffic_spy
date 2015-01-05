module TrafficSpy

  # Sinatra::Base - Middleware, Libraries, and Modular Apps
  #
  # Defining your app at the top-level works well for micro-apps but has
  # considerable drawbacks when building reusable components such as Rack
  # middleware, Rails metal, simple libraries with a server component, or even
  # Sinatra extensions. The top-level DSL pollutes the Object namespace and
  # assumes a micro-app style configuration (e.g., a single application file,
  # ./public and ./views directories, logging, exception detail page, etc.).
  # That's where Sinatra::Base comes into play:
  #
  class Server < Sinatra::Base
    class BadRequest < StandardError; end
    class Forbidden  < StandardError; end

    set :views, 'lib/views'

    get '/' do
      erb :index
    end

    post '/sources' do
      raise BadRequest, "Please make sure all fields are filled out." if
      params[:rootUrl].to_s.empty? || params[:identifier].to_s.empty?
      raise Forbidden, " Identifier already exists." unless
      Source.add(params[:identifier], params[:rootUrl])
    end

    post '/sources/:identifier/data' do |identifier|
      raise BadRequest, "Please ensure payload data is correct." unless
        params[:payload] && Payload.valid?(params[:payload])
      raise Forbidden, " Application not registered." unless
        Source.find(identifier) != nil
      raise Forbidden, " Already received request." unless
        Payload.unique?(params[:payload])
      source_id = Source.find(identifier)
      Payload.create(params[:payload], source_id[:id])
      200
    end

    get '/sources/:identifier' do |identifier|
      raise Forbidden, " Application not registered." unless
        Source.find(identifier)
      erb :source, locals: { identifier:  identifier,
                             urls:        TrafficSpy::SourceView.find_urls(identifier),
                             browsers:    TrafficSpy::SourceView.find_browsers(identifier),
                             os:          TrafficSpy::SourceView.find_all_os(identifier)#,
                            #  resolutions: TrafficSpy::SourceView.find_resolutions(identifier)
                           }
    end

    get '/sources/:identifier/urls/*' do |identifier|
        #raise Forbidden, "The URL has not been requested." unless
        # URL.find(params[:identifier])
        # source = Source.find(params[:identifier])
        @url = "/"+ params[:splat].join("/")
        if URL.exists?(@url)

            shortest_response_time = URL.shortest_response_time(source, @url)
            average_response_time  = URL.average_response_time(source, @url)
            http_verbs             = URL.http_verbs(source, @url)
            popular_referrers      = URL.popular_referrers(source, @url)
            popular_user_agents    = URL.popular_user_agents(source, @url)
            erb :urls, locals: { identifier: identifier,
                                 longest_response_time: TrafficSpy::URLsView.longest_response_time(identifier, url),
                                 shortest_response_time: shortest_response_time,
                                 average_response_time: average_response_time,
                                 http_verbs: http_verbs,
                                 popular_referrers: popular_referrers,
                                 popular_user_agents: popular_user_agents}
            # else
            #   # @message = "The url #{@url} has never been requested"
            #   erb :error
        end
     end

    get '/sources/:identifier/events' do |identifier|
      raise Forbidden, " Application not registered." unless
        Source.find(identifier) != nil
      source = Source.find(identifier)[:identifier]
      erb :events, :locals => {:source => source}
    end

    error BadRequest do
      status 400
      erb :error
      body "400 Bad request\n" + env['sinatra.error'].message
    end

    error Forbidden do
      status 403
      body = "403 Forbidden" + env['sinatra.error'].message
      erb :error, :locals => {:body => body}
      body
    end

    not_found do
      status 404
      body = "Sorry, we can't find that page."
      erb :error, locals: {body: body}
    end

    # configure :development do
    #   use BetterErrors::Middleware
    #   BetterErrors.application_root = File.expand_path('..', __FILE__)
    # end
    #
    # get '/' do
    #   raise 'Oops! See better errors page'
    # end
  end
end
