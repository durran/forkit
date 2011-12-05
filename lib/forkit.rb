require "forkit/enumerable"
require "forkit/iterator"
require "forkit/version"

class Array

  # We hook into array to be able to easily handle concurrent processing of
  # each blocks.
  #
  # @example Execute each in parallel.
  #   [ 1, 2, 3, 4, 5 ].forked.each do |object|
  #     p object
  #   end
  #
  # @param [ Integer ] threshold The threshold where to process in a single
  #   thread.
  #
  # @return [ Forkit::Enumerable ] The proxy process.
  #
  # @since 0.1.0
  def forked(threshold = 100000)
    Forkit::Enumerable.new(self, threshold)
  end
end
