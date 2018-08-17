require 'rails_helper'
feature "Message created" do
  before(:each) do
    create(:user)
    visit users_new_path
    fill_in "username", with: "mcbobster21"
    click_button "Sign In"
  end

  scenario "message created successfully" do
    fill_in "message", with: 'default message'
    click_button "Create"
    expect(page).to have_content "default message"
    expect(page).to have_current_path(messages_path)
  end

  scenario "message creation unsuccessful" do
    fill_in "message", with: 'dkd'
    click_button "Create"
    expect(page).to have_content "Could not create message"
    expect(page).to have_current_path(messages_path)
  end

end
