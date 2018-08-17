require 'rails_helper'
feature 'Like Features' do
  before do
    @user = create(:user)
    log_in 
    @secret = create(:secret, user: @user)
  end 
  feature 'secret has not been liked' do
    before(:each) do 
      visit '/secrets'
    end     
    scenario "like count updated correctly" do
      expect(page).to have_text(@secret.content)
      expect(page).to have_text('0 likes')
    end
    scenario "displays like button if you haven't liked secret" do 
      expect(page).to have_link('Like')
    end
    scenario "liking will update like count, like button not visible" do 
      click_link "Like"
      expect(page).to_not have_link("Like")
      expect(page).to have_text('1 likes')
    end
  end
  feature "secret has been liked" do 
    before do 
      @like = create(:like, user: @user, secret: @secret)
    end
    before(:each) do 
      visit '/secrets'
    end     
    scenario "unlike button is visible" do 
      expect(page).to have_link("Unlike")
    end
    scenario "unliking will update like count" do 
      click_link "Unlike"
      expect(page).to_not have_link("Unlike")
      expect(page).to have_text("0 likes")
    end
  end
end