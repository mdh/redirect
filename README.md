# Redirect

http://github.com/p8/redirect/tree/master

## Description
Redirect is a simple Ruby redirect DSL built on Rack.
It's like a simple Ruby mod_rewrite, so you can write and test your redirects in Ruby.

## Getting started
Install the gem `gem install redirect`
Create a new redirect rack app: `redirect_app my_redirect_app`
This creates a directory called `my_redirect_app` with the required files and tests.
Open `my_redirect_app/my_redirect_app.rb` in your favorite editor and add some redirect rules.

To locally run the app locally `ruby my_redirect_app.rb`

## Defining redirects

Redirects are processed in the same order as they are defined:
`redirect  ['/catch_url', '/redirect_url'], ['/catch_url2', '/redirect_url2']`
The first one is evaluated first, then the next one, etc..              
The catch_url can be a regular expression:
  `['^/some_regexp', '/all']`
  `[/old\/(.*)/, '/new/$1']`  # /old/2008/02/01 will be redirected to /new/2008/02/01

You can pass extra options.
- :code # Overwrite the http code (defaults is 301) in the options,
- :name # named redirects are public so they'll appear in you sitemap.
`['/catch_url', '/redirect_url', {:code => 307, :name => 'redirect link'}]`

The default redirect code can be changed by specifying:
  `Redirect.default_code = 307`

Alle redirects with a name will be specified in the generated /sitemap.xml.

## License

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
