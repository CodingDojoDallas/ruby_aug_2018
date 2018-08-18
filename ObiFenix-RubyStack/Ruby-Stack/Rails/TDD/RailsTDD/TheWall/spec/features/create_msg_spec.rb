require "rails_helper"

feature "creating a message" do
    before(:each) do
        @user = create(:user)
        visit root_path
        fill_in "username", with: "codingdojo"
        click_button "Sign In"
    end

    # [ PASS TEST VALIDATION ]
    # => CONTROL
    scenario "successfully creating a message" do
        fill_in "message", with: "This is my cool message"
        click_button "Post a Message"
        expect(current_path).to eq(messages_path)
        message = Message.first
        date = message.created_at.strftime("%B #{message.created_at.day.ordinalize}, %Y")
        expect(page).to have_content("#{User.first.username} - #{date}")
        expect(page).to have_content(Message.first.message)
    end

    # [ FAIL TO PASS TEST VALIDATION ]
    scenario "unsuccessfully creating a message when is blank" do
        fill_in "message", with: ""
        click_button "Post a Message"
        expect(current_path).to eq(messages_path)
        expect(page).to have_content("Message can't be blank")
    end

    scenario "unsuccessfully creating a message when is shorter than 10 character" do
        fill_in "message", with: "hello"
        click_button "Post a Message"
        expect(current_path).to eq(messages_path)
        expect(page).to have_content("Message is too short (minimum is 10 characters)")
    end
end