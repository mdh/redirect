require 'rubygems'
require 'rack'
require 'rack/showexceptions'
require 'rack/request'
require 'rack/response'

def redirect(redirects)

  app = Rack::Redirect.new(redirects)
  Rack::Handler::WEBrick.run \
    Rack::ShowExceptions.new(Rack::Lint.new(app)),
    :Port => 3000
  run app
end

module Redirect
  VERSION = '0.0.1'
end


module Rack

  class Redirect
          
    def initialize(redirects)
      @redirects = redirects
    end
    
    def call(env)
      req = Request.new(env)
      @redirects.each do |pair|
        key, value = pair
        if req.fullpath.match(key)
          return [301, {"Location" => value, "Content-Type" => "text/html"}, "Redirecting to: #{value}"]
        end
      end
      [404, {"Content-Type" => "text/html"}, "not found"]
    end
    
  end
  
end