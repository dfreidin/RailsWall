require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "With vaild attributes" do
    it "should save" do
      expect(build(:comment, user: build(:user), message: build(:message, user: build(:user)))).to be_valid
    end
  end
  context "with invalid attributes" do
    it "should not save if comment field is blank" do
      expect(build(:comment, user: build(:user), comment: "", message: build(:message, user: build(:user)))).to be_invalid
    end
    it "should not save if comment length <= 10" do
      expect(build(:comment, user: build(:user), comment: "too short", message: build(:message, user: build(:user)))).to be_invalid
    end
    it "should not save if user field is blank" do
      expect(build(:comment, message: build(:message, user: build(:user)))).to be_invalid
    end
    it "should not save if message field is blank" do
      expect(build(:comment, user: build(:user)))
    end
  end
end
