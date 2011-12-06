Overview
========
Forkit is an extremely simple gem to make leveraging multiple cores on
long-running array iterations easy. It encapsulates Java's `ForkJoinPool` and
`RecursiveAction` behind a simple #each call on a Ruby array. The number of
cores that will be used is based on the value returned by
`Runtime.availableProcessors()`.

For more information on the Java API, see:

* [ForkJoinPool](http://docs.oracle.com/javase/7/docs/api/java/util/concurrent/ForkJoinPool.html)
* [RecursiveAction](http://docs.oracle.com/javase/7/docs/api/java/util/concurrent/RecursiveAction.html)

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
In your Gemfile:

```ruby
gem "forkit"
```

In your application:
```ruby
require "forkit"
```

Usage
=====
```ruby
# Execute the block for each element in the array, using multiple cores
# if available.
array.forked.each do |object|
  object.some_expensive_action
end

# Execute the block for each element in the array, but for any size under
# 100000 objects execute synchronously.
array.forked(100000).each do |object|
  object.some_expensive_action
end
```

Running Specs
=============
```ruby
rake
```
