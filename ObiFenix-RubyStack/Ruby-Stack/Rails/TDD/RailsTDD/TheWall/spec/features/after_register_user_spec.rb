require "rails_helper"

feature "after registering user" do
  before(:each) do
    @user = create(:user)
    @comment = create(:message, user: @user)
    visit root_path
    fill_in "username", with: "codingdojo"
    click_button "Sign In"
  end

  scenario "there should be a logout feature" do
    expect(page).to have_link("Log out")
    click_link("Log out")
    expect(current_path).to eq(new_user_path)
  end

  scenario "there should be a form to create a message" do
    expect(page).to have_field("message")
    expect(page).to have_button("Post a Message")
  end

  scenario "there should be a form to create a comment if there's a message" do
    expect(page).to have_field("comment")
    expect(page).to have_button("Post a Comment")
  end
end