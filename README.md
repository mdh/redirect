# Redirect

http://github.com/p8/redirect/tree/master

## Description
Redirect is a simple Ruby redirect DSL built on Rack.
It's like a simple Ruby mod_rewrite, so you can write and test your redirects in Ruby.

## Getting started
Create a new redirect rack app by running the following:

  redirect_app PROJECT_NAME

This creates a directory PROJECT_NAME with the required files and tests.
PROJECT_NAME.rb contains the main logic.

To locally run the app you can do:  

  ruby PROJECT_NAME.rb

## Redirects

The first one is evaluated first, then the next one, etc..

  redirect  ['/catch_url', '/redirect_url'],
            ['/catch_url2', '/redirect_url2']
              
The catch_url can be a regular expression:
  ['^/some_regexp', '/all']
  [/old\/(.*)/, '/new/$1']  # /old/2008/02/01 will be redirected to /new/2008/02/01

You can pass extra options.

 :code # Overwrite the http code (defaults is 301) in the options
 :name # named redirects are public so they'll appear in you sitemap

  ['/catch_url', '/redirect_url', {:code => 307, :name => 'redirect link'}]

The default redirect code can be changed:
  
  Redirect.default_code = 307

A sitemap.xml is generated for all redirects that have a name.

# License

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
