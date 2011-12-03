require "java"
import java.util.concurrent.RecursiveAction

module Concurrent

  # The iterator is a recursive action that executes in parallel on a
  # ForkJoinPool.
  class Iterator < RecursiveAction

    # @attribute [r] block The block to execute on each object.
    # @attribute [r] objects The array to process.
    # @attribute [r] threshold The single process threshold count.
    attr_reader :block, :objects, :threshold

    # Splits the work into the appropriate chunks and executes in parallel.
    #
    # @example Execute in parallel.
    #   iterator.compute
    #
    # @return [ nil ] nil.
    #
    # @since 0.1.0
    def compute
      if objects.size <= threshold
        objects.each do |object|
          block.call(object)
        end
      else
        midpoint = objects.size / 2
        invoke_all(
          Iterator.new(objects[0, midpoint], threshold, block),
          Iterator.new(objects[midpoint, objects.size], threshold, block)
        )
      end
    end

    # Instantiate the new iterator.
    #
    # @example Create the iterator.
    #   Enumerable.new([ 1, 2, 3 ], 100000)
    #
    # @param [ Array<Object> ] objects The object array.
    # @param [ Integer ] threshold The single process threshold count.
    #
    # @return [ Concurrent::Iterator ] The concurrent iterator.
    #
    # @since 0.1.0
    def initialize(objects, threshold, block)
      super()
      @objects, @threshold, @block = objects, threshold, block
    end

    # Convenience method for invoking against the class.
    #
    # @example Invoke the tasks.
    #   iterator.invoke_all(tasks)
    #
    # @param [ Array<RecursiveAction> ] args The tasks to execute.
    #
    # @return [ nil ] nil.
    #
    # @since 0.1.0
    def invoke_all(*args)
      self.class.invoke_all(*args)
    end
  end
end
