require 'lib/redirect'

redirect  ['/old_url', '/new_url', {:code => 307}],
          ['^/some_regexp', '/all']