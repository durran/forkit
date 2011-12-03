"Duke", "Duke of York", "Fork"...

Requirements
============
- JRuby 1.6.5 +
- JDK 7 +

Environment
===========
- JRUBY_OPTS="--1.9 --server -Xinvokedynamic.constants=true"
- RUBYOPT="rubygems"

Installation
============
```ruby
gem "theduke"
```

Usage
=====
```ruby
array.concurrently.each do |object|
  # Code here to execute in parallel on the object.
end

array.concurrently(100000).each do |object|
  # Code here to execute in parallel on the object.
end
```

Running Specs
=============
```ruby
rake
```
