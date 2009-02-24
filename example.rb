require 'lib/redirect'

redirect  ['/old_url', '/new_url', {:code => 307, :name => 'test'}],
          [/old\/(.*)/, '/new/$1'],
          ['^/some_regexp', '/all'],