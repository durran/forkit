require "spec_helper"

describe Array do

  describe "#each" do

    let(:array) do
      (1...100).map do
        stub.tap do |s|
          s.expects(:executed).once
        end
      end
    end

    context "when providing a block" do

      context "when passed a threshold" do

        it "iterates over each of the elements" do
          array.concurrently(10).each do |element|
            element.executed
          end
        end
      end

      context "when no threshold is passed" do

        it "iterates over each of the elements" do
          array.concurrently.each do |element|
            element.executed
          end
        end
      end
    end

    context "when no block is provided" do

      it "returns the standard enumerator" do
        [].concurrently.each.should be_a(Enumerator)
      end
    end
  end
end
