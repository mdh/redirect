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
      redirects.keys.each{|k| raise "redirect url should start with a slash" unless k =~ /^\//}
      @redirects = redirects
    end
    
    def call(env)
      req = Request.new(env)
      if @redirects[req.fullpath]
        [301, {"Location" => @redirects[req.fullpath], "Content-Type" => "text/html"}, "Redirecting to: #{@redirects[req.fullpath]}"]
      else
        [404, {"Content-Type" => "text/html"}, "not found"]
      end
    end
    
  end
  
end