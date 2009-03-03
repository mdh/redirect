require 'redirect'
require 'test/unit'

class Test::Unit::TestCase

  def assert_redirects(from, to)
    res = Rack::MockRequest.new(APP[:redirect_app]).get(from)
    res.headers.should == { 'Location' => to, 'Content-Type' => 'text/html' }
    res.body.should == "Redirecting to: \#{to}"
  end

end

APP = {}

def redirect(*redirects)
  APP[:redirect_app] = Rack::Redirect.new(*redirects)
end