require 'rails_helper'
feature "User signs in" do
  before(:each) do
    visit users_new_path
    create(:user)
  end

  scenario "user successfully signs in" do
    fill_in "username", with: "mcbobster21"
    click_button "Sign In"
    expect(page).to have_current_path(messages_path)
  end
  # scenario "user unsuccessfully signs in because username is left blank" do
  #   click_button "Sign In"
  #   expect(page).to have_content "Username can't be blank"
  #   expect(page).to have_current_path(users_new_path)
  # end
  scenario "user unsuccessfully signs in because username is invalid" do
    fill_in "username", with: "jfklsdghaslkf;fd"
    click_button "Sign In"
    expect(page).to have_content "Username not found"
    expect(page).to have_current_path(users_new_path)
  end

  scenario "user attempts to go directly into messages_path" do
    visit messages_path
    expect(current_path).to eq(users_new_path)
    expect(page).to have_content "You must sign in first"
  end
end
