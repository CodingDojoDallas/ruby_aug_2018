require 'rails_helper'

# =================================================
# Feature Testing... [ USER Rgistration Work Flow ]
# =================================================
feature "User creates an account" do

  before(:each) do
    visit new_user_path
  end

  scenario "successfully creates a new user account" do
    fill_in "user_first_name", with: "Michael"
    fill_in "user_last_name", with: "jordan"
    fill_in "user_email", with: "mjordan@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "Welcome, Michael"
    # We'll be redirecting to the user show page is user succesfully created
    expect(page).to have_current_path(user_path(User.last))
  end

  scenario "unsuccessfully creates a new user account" do
    click_button "Create User"
    expect(current_path).to eq(new_user_path)
  end

  scenario "doesn't fill out first name field" do
    fill_in "user_last_name", with: "Jordan"
    fill_in "user_email", with: "mjordan@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "First name can't be blank"
  end

  scenario "doesn't fill out last name field" do
    fill_in "user_first_name", with: "Michael"
    fill_in "user_email", with: "mjordan@codingdojo.com"
    click_button "Create User"
    expect(page).to have_content "First name can't be blank"
  end

  scenario "doesn't fill out email field" do
    fill_in "user_first_name", with: "Michael"
    fill_in "user_last_name", with: "Jordan"
    click_button "Create User"
    expect(page).to have_content "First name can't be blank"
  end
end