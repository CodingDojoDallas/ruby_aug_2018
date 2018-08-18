require 'rails_helper'

# =================================================
# Feature Testing... [ USER Rgistration Work Flow ]
# =================================================
feature "registering user" do

  # [ Valid REGISTRATION ]
  scenario "successfully signs in an user" do
    create(:user)
    visit root_path
    fill_in "username", with: "MJ"
    click_button "Sign In"
    expect(page).to have_content("Welcome #{User.first.username}")
    expect(current_path).to eq(messages_path)
  end

  # [ Invalid REGISTRATION ]
  scenario "unsuccessfully sign in a user" do
    visit root_path
    fill_in "username", with: "no one"
    click_button "Sign In"
    expect(page).to have_content("Could not find username")
    expect(current_path).to eq(root_path)
  end
end