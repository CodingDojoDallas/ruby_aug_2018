require 'rails_helper'

RSpec.describe User, type: :model do

  context "With valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
  end

  context "With invalid attributes" do
    it "should not save if username field is blank" do
      expect(build(:user, username: "")).to be_invalid
    end

    it "should not save if username is less that 5 characters" do
      expect(build(:user, username: "12345")).to be_invalid
    end

    it "should be a unique username" do
      userq = create(:user, username: "dojomaster")
      expect(build(:user, username: "dojomaster")).to be_invalid
    end
  end
end