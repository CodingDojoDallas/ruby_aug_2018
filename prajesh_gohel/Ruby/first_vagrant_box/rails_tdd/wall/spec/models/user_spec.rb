require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
  end

  context "With invalid attributes" do
    it "should not save if first name is blank" do
      expect(build(:user, first_name: '')).to be_invalid
    end
    it "should not save if last name is blank" do
      expect(build(:user, last_name: '')).to be_invalid
    end
    it "should not save if email is blank" do
      expect(build(:user, email: '')).to be_invalid
    end
    it "should not save if email exists" do
      create(:user)
      expect(build(:user, username: 'tonystark')).to be_invalid
    end
    it "should not save if email is invalid" do
      expect(build(:user, email: 'thisisinvalid1234')).to be_invalid
    end
    it "should not save if username is blank" do
      expect(build(:user, username: '')).to be_invalid
    end
    it "should not save if username is less than or equal to 5 characters" do
      expect(build(:user, username: 'hi')).to be_invalid
    end
    it "should not save if username already exists" do
      create(:user)
      expect(build(:user, email: 'tony@stark.com')).to be_invalid
    end
  end
end
