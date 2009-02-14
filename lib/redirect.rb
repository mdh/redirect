require 'rubygems'
require 'rack'
require 'rack/showexceptions'
require 'rack/request'
require 'rack/response'

module Redirect
  VERSION = '0.0.1'
  
  class Data
    attr_reader :catch_url, :redirect_url, :code, :name
    def initialize(catch_url, redirect_url, options = {})
      @catch_url = catch_url
      @redirect_url = redirect_url
      @code = options[:code] || 301
      @name = options[:name]
    end
  end
    
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
    attr_reader :redirects
    def initialize(*redirects)
      @redirects = redirects.collect do |r|
        ::Redirect::Data.new(*r)
      end
    end
    
    def call(env)
      req = Request.new(env)
      @redirects.each do |data|
        if req.fullpath.match(data.catch_url)
          puts "Match found for #{data.catch_url}."
          puts "Redirecting to #{data.redirect_url}"
          return [data.code, {"Location" => data.redirect_url, "Content-Type" => "text/html"}, "Redirecting to: #{data.redirect_url}"]
        end
      end
      [404, {"Content-Type" => "text/html"}, "not found"]
    end
    
  end
  
end