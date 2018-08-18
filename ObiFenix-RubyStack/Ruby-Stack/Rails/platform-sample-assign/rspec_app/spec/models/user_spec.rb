require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe User do
  # =======================
  # Control  [ VALID TEST ]
  # =======================
  context "With valid attributes" do
    it "should save" do
      user = User.new(first_name: 'Shane', last_name: 'chang', email: 'schang@codingdojo.com')
      expect(user).to be_valid
    end
  end

  # ================
  # [ INVALID TEST ]
  # ================
  context "With invalid attributes" do

    # TEST #1 => Empty <first_name> field
    it "should not save if first_name field is blank" do
      user = User.new(first_name: '', last_name: 'Chang', email: 'schang@codingdojo.com')
      expect(user).to be_invalid
    end

    # TEST #2 => Empty <last_name> field
    it "should not save if last_name field is blank" do
      user = User.new(first_name: 'Shane', last_name: '', email: 'schang@codingdojo.com')
      expect(user).to be_invalid
    end

    # TEST #3 => Empty <email> field
    it "should not save if email field is blank" do
      user = User.new(first_name: 'Shane', last_name: 'Chang', email: '')
      expect(user).to be_invalid
    end

    # TEST #4 => Uniqueness <email> field
    it "should not save if email already exists" do
			User.create(first_name: "Shane", last_name: "Chang", email: "schang@codingdojo.com")
			user = User.new(first_name: "Shane", last_name: "Chang", email: "schang@codingdojo.com")
			expect(user).to be_invalid
		end

    # TEST #5 => correct <email> format
		it "should contain a valid email" do
			user = User.new(first_name: 'Arden', last_name: 'Zhan', email: 'invalidemail')
			expect(user).to be_invalid
		end

    it "should not save if last_name field is blank"
    it "should not save if email already exists"
    it "should not save if invalid email format"
  end

end