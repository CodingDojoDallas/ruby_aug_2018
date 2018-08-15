require 'rails_helper'
feature "User Settings features" do
  before do
    @user = create(:user)
    log_in
  end

  feature "User Settings Dashboard" do
    before(:each) do
      visit "/users/#{@user.id}/edit"
    end

    scenario "visits users edit page" do
      expect(page).to have_field "user[email]"
      expect(page).to have_field "user[name]"
    end

    scenario "inputs filled out correctly" do
      expect(find_field("user[name]").value).to eq(@user.name)
      expect(find_field("user[email]").value).to eq(@user.email)
    end

    scenario "incorrectly updates information" do
      fill_in "user[name]", with: "PFresh"
      fill_in "user[email]", with: "notanemail"
      click_button "Update"
      expect(page).to have_current_path "/users/#{@user.id}/edit"
      expect(page).to have_text "Email is invalid"
    end

    scenario "correctly updates information" do
      fill_in "user[name]", with: "PFresh"
      fill_in "user[email]", with: "correct@email.com"
      click_button "Update"
      expect(page).to have_current_path "/users/#{@user.id}"
      expect(page).to have_text "PFresh"
    end

    scenario "destroys user and redirects to registration page" do
      click_link "Delete Account"
      expect(current_path).to eq "/users/new"
    end
  end
end
