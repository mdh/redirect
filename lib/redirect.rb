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
      @code = options[:code] || Redirect.default_code
      @name = options[:name]
    end
  end
  
  def self.default_code= default_code
    @default_code = default_code
  end
  
  def self.default_code
    @default_code ||= 301
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
      if req.fullpath == '/sitemap.xml'
        return [200, {"Content-Type" => "text/xml"}, sitemap(req.host)]
      end
      @redirects.each do |r|
        if req.fullpath.match(r.catch_url)
          puts "Match found for #{r.catch_url}."
          puts "Redirecting to #{r.redirect_url}"
          return [r.code, {"Location" => r.redirect_url, "Content-Type" => "text/html"}, "Redirecting to: #{r.redirect_url}"]
        end
      end
      [404, {"Content-Type" => "text/html"}, "not found"]
    end
   
    def sitemap(host)
      %(<?xml version="1.0" encoding="UTF-8"?>\n) +
      %(<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n) +
      @redirects.select{|r| r.name }.collect { |r|
        %(<url>\n) +
          %(<loc>http://#{host}#{r.redirect_url}</loc>\n) +
        %(</url>\n)}.join +
      %(</urlset>\n)
    end      
    
  end
  
end