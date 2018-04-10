require 'rails_helper'

RSpec.describe Message, type: :model do
  context "With vaild attributes" do
    it "should save" do
      expect(build(:message, user: build(:user))).to be_valid
    end
  end
  context "with invalid attributes" do
    it "should not save if message field is blank" do
      expect(build(:message, user: build(:user), message: "")).to be_invalid
    end
    it "should not save if message length <= 10" do
      expect(build(:message, user: build(:user), message: "too short")).to be_invalid
    end
    it "should not save if user field is blank" do
      expect(build(:message)).to be_invalid
    end
  end
end
