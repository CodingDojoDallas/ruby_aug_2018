require "rails_helper"

feature "creating a comment" do
    before(:each) do
        @user = create(:user)
        @message = create(:message, user: @user)
        visit root_path
        fill_in "username", with: "MJ"
        click_button "Sign In"
    end

    # [ PASSED TEST VALIDATION ]
    scenario "successfully creating a comment" do
        fill_in "comment", with: "This is a really cool comment"
        click_button "Post a Comment"
        expect(current_path).to eq(messages_path)
        comment = Comment.first
        date = comment.created_at.strftime("%B #{comment.created_at.day.ordinalize}, %Y")
        expect(page).to have_content("#{User.first.username} - #{date}")
        expect(page).to have_content(Comment.first.content)
    end

    # [ FAILD TO PASS TEST VALIDATION ]
    scenario "unsuccessfully creating a comment when is blank" do
        fill_in "comment", with: ""
        click_button "Post a Comment"
        expect(current_path).to eq(messages_path)
        expect(page).to have_content("Content can't be blank")
    end

    scenario "unsuccessfully creating a message when is shorter than 10 character" do
        fill_in "comment", with: "hello"
        click_button "Post a Comment"
        expect(current_path).to eq(messages_path)
        expect(page).to have_content("Content is too short (minimum is 10 characters)")
    end
end