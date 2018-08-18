require 'rails_helper'

RSpec.describe User, type: :model do

  # =======================
  # Control  [ VALID TEST ]
  # =======================
  context "With valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
  end


  # ================
  # [ INVALID TEST ]
  # ================
  context "With invalid attributes" do

    # TEST #1 => Empty <username> field
    it "should not save if <username> field is blank" do
      expect(build(:user, username: "")).to be_invalid
    end

    # TEST #1 => <username> field is at least 5 characters long
    it "should not save if <username> field is blank" do
      expect(build(:user, username: "12345")).to be_invalid
    end

    # TEST #4 => Uniqueness <email> field
    it "should not save if email already exists" do
      create(:user)
			expect(build(:user)).to be_invalid
		end

  end
end