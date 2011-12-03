require "concurrent/enumerable"
require "concurrent/iterator"
require "concurrent/version"

class Array

  # We hook into array to be able to easily handle concurrent processing of
  # each blocks.
  #
  # @example Execute each concurrently.
  #   [ 1, 2, 3, 4, 5 ].concurrently.each do |object|
  #     p object
  #   end
  #
  # @param [ Integer ] threshold The threshold where to process in a single
  #   thread.
  #
  # @return [ Concurrent::Process ] The proxy process.
  #
  # @since 0.1.0
  def concurrently(threshold = 100000)
    Concurrent::Enumerable.new(self, threshold)
  end
end
