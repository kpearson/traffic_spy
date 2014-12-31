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

    post '/source' do
      raise BadRequest if params[:rootUrl].to_s.empty? || params[:identifier].to_s.empty?
      URL.add(params[:rootUrl])
      raise Forbidden unless Source.create(params[:identifier], URL.find(params[:rootUrl]).id)
      200
    end
    
    not_found do
      erb :error
    end

    error BadRequest do
      status 400
      body "400 Bad request/n Please make sure all fields are filled out."
    end

    error Forbidden do
      status 403
      body "403 Forbidden/n Please ensure identifier is unique."
    end
  end
end
