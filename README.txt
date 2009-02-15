= Redirect

http://github.com/p8/redirect/tree/master

== DESCRIPTION:

Redirect is a ruby redirect server build on Rack

== EXAMPLE

Create a file and pass an array to the redirect method:

  require 'redirect'
  redirect  ['/catch_url', '/redirect_url'],
            ['/catch_url2', '/redirect_url2', {:code => 307, :name => 'redirect link'}],  
            ['^/some_regexp', '/all']
            
The catch_url can be a regular expression.
You can overwrite the default 301 http code in the options.

The default redirect code can be changed:
  
  Redirect.default_code = 307

A sitemap.xml is generated for all redirects that have a name.

== LICENSE:

(The MIT License)

Copyright (c) 2009 Petrik de Heus

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.