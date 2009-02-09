require File.dirname(__FILE__) + '/helper'

describe "Rack::Redirect" do

  it "should show 404 not found with if no redirect exists" do
    @app = Rack::Redirect.new()
    res = Rack::MockRequest.new(@app).get("/test")

    res.not_found?.should be_true
    res["Content-Type"].should == "text/html"
    res.body.should == "not found"
  end
  
  it "should redirect '/' if redirect exists" do
    @app = Rack::Redirect.new(['/', '/test'])
    res = Rack::MockRequest.new(@app).get('/')
    res.headers.should == { 'Location' => '/test', 'Content-Type' => 'text/html' }
    res.body.should == 'Redirecting to: /test'
  end  
  
  it "should redirect if redirect exists" do
    @app = Rack::Redirect.new(['/old/2008', '/2008-new'])
    res = Rack::MockRequest.new(@app).get('/old/2008')
    res.headers.should == { 'Location' => '/2008-new', 'Content-Type' => 'text/html' }
    res.body.should == 'Redirecting to: /2008-new'
  end

  it "should redirect for a regular_expression" do
    @app = Rack::Redirect.new(['^/old', '/new'])
    res = Rack::MockRequest.new(@app).get('/old/2008')
    res.headers.should == { 'Location' => '/new', 'Content-Type' => 'text/html' }
    res.body.should == 'Redirecting to: /new'
  end

  it "should allow multiple redirects" do
    @app = Rack::Redirect.new(['^/old3', '/new'], ['^/old2', '/new2'])
    res = Rack::MockRequest.new(@app).get('/old2008')
    res.headers.should == { 'Location' => '/new2', 'Content-Type' => 'text/html' }
    res.body.should == 'Redirecting to: /new2'
  end

end