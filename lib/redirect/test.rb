require 'redirect'
require 'test/unit'

class Test::Unit::TestCase

  def assert_redirects(from, to)
    res = Rack::MockRequest.new(APP[:redirect_app]).get(from)
    assert_equal to,          res.headers['Location'    ]
    assert_equal 'text/html', res.headers['Content-Type']
  end

end

APP = {}

def redirect(*redirects)
  APP[:redirect_app] = Rack::Redirect.new(*redirects)
end
