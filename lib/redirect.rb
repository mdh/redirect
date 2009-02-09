require 'rubygems'
require 'rack'
require 'rack/showexceptions'
require 'rack/request'
require 'rack/response'

module Redirect
  VERSION = '0.0.1'
end

def redirect(*redirects)

  app = Rack::Redirect.new(*redirects)
  Rack::Handler::WEBrick.run \
    Rack::ShowExceptions.new(Rack::Lint.new(app)),
    :Port => 3000
  run app
end

module Rack

  class Redirect
          
    def initialize(*redirects)
      @redirects = redirects
    end
    
    def call(env)
      req = Request.new(env)
      @redirects.each do |pair|
        key, redirect_url = pair
        if req.fullpath.match(key)
          puts "Match found for #{key}."
          puts "Redirecting to #{redirect_url}"
          return [301, {"Location" => redirect_url, "Content-Type" => "text/html"}, "Redirecting to: #{redirect_url}"]
        end
      end
      [404, {"Content-Type" => "text/html"}, "not found"]
    end
    
  end
  
end