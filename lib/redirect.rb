require 'rubygems'
require 'rack'
require 'rack/showexceptions'
require 'rack/request'
require 'rack/response'

module Redirect
  VERSION = '0.3.1'
  
  def self.default_code= default_code
    @default_code = default_code
  end
  
  def self.default_code
    @default_code ||= 301
  end

  def self.autorun= autorun
    @autorun = autorun
  end
  
  def self.autorun
    @autorun = true unless @autorun == false
    @autorun
  end

  def self.app= app
    @app = app
  end
  
  def self.app
    @app
  end
  
  class Data
    attr_reader :catch_url, :redirect_url, :code, :name
    def initialize(catch_url, redirect_url, options = {})
      @catch_url = catch_url
      @redirect_url = redirect_url
      @code = options[:code] || Redirect.default_code
      @name = options[:name]
    end
  end
    
end

def redirect(*redirects)

  Redirect.app = Rack::Redirect.new(*redirects)
  if Redirect.autorun
    Rack::Handler::WEBrick.run \
      Rack::ShowExceptions.new(Rack::Lint.new(Redirect.app)),
      :Port => 3000
    run Redirect.app
  end
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
      if req.fullpath == '/' && index
        return [200, {"Content-Type" => "text/html"}, index]
      end      
      @redirects.each do |r|
        if req.fullpath.match(r.catch_url)
          redirect_url = r.redirect_url
          if $1
            redirect_url.gsub!('$1', $1)
          end
          puts "Match found for #{r.catch_url}."
          puts "Redirecting to #{redirect_url}"
          return [r.code, {"Location" => redirect_url, "Content-Type" => "text/html"}, "Redirecting to: #{redirect_url}"]
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
    
    def index
      @index
    end
    
    def index= index
      @index = index
    end
    
  end
  
end