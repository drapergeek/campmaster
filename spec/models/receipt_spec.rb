require 'spec_helper'

describe Receipt do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:zip) }

  describe "#name" do
    it "combines the first and last names" do
      receipt = Receipt.new(first_name: 'Tony', last_name: 'Stark')
      receipt.name.should == 'Tony Stark'
    end
  end
end
