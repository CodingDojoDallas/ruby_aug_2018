require 'rails_helper'
feature "User logs out" do
  before(:each) do
    create(:user)
    visit users_new_path
    fill_in "username", with: "mcbobster21"
    click_button "Sign In"
  end

  scenario "user successfully logs out" do
    click_link "Logout"
    expect(current_path).to eq(users_new_path)
  end
end
