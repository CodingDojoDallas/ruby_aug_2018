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

    # TEST #1 => Empty <first_name> field
    it "should not save if first_name field is blank" do
      expect(build(:user, first_name: "")).to be_invalid
    end

    # TEST #2 => Empty <last_name> field
    it "should not save if last_name field is blank" do
      expect(build(:user, last_name: "")).to be_invalid
    end

    # TEST #3 => Empty <email> field
    it "should not save if email field is blank" do
      expect(build(:user, email: "")).to be_invalid
    end

    # TEST #4 => Uniqueness <email> field
    it "should not save if email already exists" do
      create(:user)
			expect(build(:user)).to be_invalid
		end

    # TEST #5 => correct <email> format
		it "should not save if innvalid email format" do
			expect(build(:user, email: "invalidEmail")).to be_invalid
		end

  end
end