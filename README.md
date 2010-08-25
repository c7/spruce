# Spruce ↟

## Description

Spruce is a Ruby wrapper around the [Forrst API](http://forrst.com/apidocs.html). 
The Forrst API is currently a _moving target_ and the plan is to develop Spruce 
alongside it, as close as possible.

Spruce will support authentication via API tokens.

## Installation

    gem install spruce

## Dependencies

The [YAJL C Bindings for Ruby](http://github.com/brianmario/yajl-ruby) are so 
full of **AWESOME** that it is almost impossible to not use them everywhere JSON 
is involved, so I didn’t.

## Getting started

    require 'rubygems'
    require 'spruce'
    
    # Retrieve a user by username
    kyle = Forrst::User.find_by_username 'kyle'
    kyle.posts # => Kyles latest PUBLIC posts
    
    # Retrieve a user by id
    peter = Forrst::User.find 5079
    peter.info  # => Public information about Peter
    
## Links

  - [Forrst API](http://forrst.com/apidocs.html)
  - [YAJL C Bindings for Ruby](http://github.com/brianmario/yajl-ruby)

## LICENCE

Copyright (c) 2010 Peter Hellberg

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.