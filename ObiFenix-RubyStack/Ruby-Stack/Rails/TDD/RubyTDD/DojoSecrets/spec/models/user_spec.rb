require 'rails_helper'

RSpec.describe User, type: :model do

  # =========================
  # TEST FOR VALID ATTRIBUTES
  # =========================
  context "with valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
    it 'automatically encrypts the password into the password_digest attribute' do
      expect(build(:user).password_digest.present?).to eq(true)
    end
    it 'email as lowercase' do
      expect(create(:user, email: 'EMAIL@GMAIL.COM').email).to eq('email@gmail.com')
    end
  end

  # ===========================
  # TEST FOR INVALID ATTRIBUTES
  # ===========================
  context "with invalid attributes should not save if" do

    # Empty <name> field
    it 'name is blank' do
      expect(build(:user, name: '')).to be_invalid
    end

    # Empty <email> field
    it 'email is blank' do
      expect(build(:user, email: '')).to be_invalid
    end

    # Incorrect <email> format [EMAIL_REGEX]
    it 'email format is wrong' do
      emails = ["@user", "@example.com"]
      emails.each do |email|
        expect(build(:user, email: email)).to be_invalid
      end
    end

    # Fail to provide a unique <email>
    it 'email is not unique' do
      create(:user)
      expect(build(:user)).to be_invalid
    end

    # Empty <password> field
    it 'password is blank' do
      expect(build(:user, password: '')).to be_invalid
    end

    # <password> and <password_confirmation> don't match
    it "password doesn't match password_confirmation" do
      expect(build(:user, password_confirmation: 'notpassword')).to be_invalid
    end
  end
end
