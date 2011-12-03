Requirements
============
- JRuby 1.6.5 +
- JDK 7 +

Environment
===========
JRUBY_OPTS=--1.9
RUBYOPT="rubygems"

Running Specs
=============
rake

Usage
=====
  array.concurrently.each do |object|
    # Code here to execute in parallel on the object.
  end