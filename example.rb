require 'lib/redirect'

redirect  ['/old_url', '/new_url', {:code => 307, :name => 'test'}],
          ['^/some_regexp', '/all']