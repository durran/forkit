require "java"
import java.util.concurrent.ForkJoinPool

module Forkit

  # The enumerable allows for concurrent processing via JDK7's ForkJoinPool.
  class Enumerable

    # @attribute [r] objects The array to process.
    # @attribute [r] threshold The single process threshold count.
    attr_reader :objects, :threshold

    # Instantiate the new concurrent enumerable.
    #
    # @example Create the enumerable.
    #   Enumerable.new([ 1, 2, 3 ], 100000)
    #
    # @param [ Array<Object> ] objects The object array.
    # @param [ Integer ] threshold The single process threshold count.
    #
    # @return [ Forkit::Enumerable ] The concurrent enumerable.
    #
    # @since 0.1.0
    def initialize(objects, threshold)
      @objects, @threshold = objects, threshold
    end

    # Execute the provided block for each element in the array.
    #
    # @example Execute in parallel.
    #   enum.each do |object|
    #     p object
    #   end
    #
    # @return [ nil ] nil.
    #
    # @since 0.1.0
    def each(&block)
      if block_given?
        ForkJoinPool.new.invoke(Iterator.new(objects, threshold, block))
      else
        objects.each
      end
    end
  end
end
