require 'spec_helper'

describe Tweet do
  let!(:tweet) { create(:tweet)}
  describe "validations" do
    it "has a valid factory" do
      expect(build(:tweet)).to be_valid
    end

    it "has a message" do
      expect(build(:tweet, message: nil)).to be_invalid
    end

    it "message has >0 characters" do
    
    end

    pending "message has <=140 characters"

    it "has an author" do
      expect(build(:tweet, author: nil)).to be_invalid
    end
  end
end
