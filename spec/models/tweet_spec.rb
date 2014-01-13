require 'spec_helper'

describe Tweet do
  let!(:tweet) { create(:tweet)}
  long_message = "This is a long message for the purposes of testing 
                  whether or not the tweet with a long message would 
                  be invalid. It will all work out in the end. I should 
                  probably cut this across multiple lines."
  describe "validations" do
    it "has a valid factory" do
      expect(build(:tweet)).to be_valid
    end

    it "has a message" do
      expect(build(:tweet, message: nil)).to be_invalid
    end

    it "message has >0 characters" do
      expect(build(:tweet, message: "")).to be_invalid
    end

    it "message has <=140 characters" do
      expect(build(:tweet, message: long_message)).to be_invalid
    end

    it "has an author" do
      expect(build(:tweet, author: nil)).to be_invalid
    end
  end
end
