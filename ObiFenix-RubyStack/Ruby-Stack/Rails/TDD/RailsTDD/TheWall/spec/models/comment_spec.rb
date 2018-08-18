require 'rails_helper'

RSpec.describe Comment, type: :model do

  before(:each) do
    @user = build(:user)
    @message = build(:message, user: @user)
  end

  # ======================
  # Control [ VALID Test ]
  # ======================
  context "With valid attributes" do
    it "should save" do
      expect(build(:comment, user: @user, message: @message)).to be_valid
    end
  end

  # =========================
  #   Other [ INVALID TEST ]
  # =========================
  context "With invalid attributes" do
    it "should not save if content field is blank" do
      expect(build(:comment, content: "", user: @user, message: @message)).to be_invalid
    end

    it "should not save if content field is less than 10 characters" do
      expect(build(:comment, content: "hello", user: @user, message: @message)).to be_invalid
    end

    it "should not save if there is no user references" do
      expect(build(:comment, message: @message)).to be_invalid
    end
    it "should not save if there is no message references" do
      expect(build(:comment, user: @user)).to be_invalid
    end
  end

end