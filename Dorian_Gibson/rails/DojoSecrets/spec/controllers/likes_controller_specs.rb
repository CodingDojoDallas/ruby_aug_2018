require "rails_helper"
RSpec.describe LikesController, type: :controller do
  before do
    @user = create(:user)
    @user2 = create(:user, email: "another@mail.com")
    @secret = create(:secret, user: @user)
    @like = create(:like, secret: @secret, user: @user)
  end

  context "when not logged in" do
    before do
      session[:user_id] = nil
    end

    it "cannot create a like" do
      get :create, id: @user
      expect(response).to redirect_to "/sessions/new"
    end

    it "cannot destroy a like" do
      get :destroy, id: @user
      expect(response).to redirect_to "/sessions/new"
    end
  end

  context "when signed in as the wrong user" do
    before do
      session[:user_id] = @user2
    end
    it "shouldn't be able to destroy a like" do
      get :destroy, id: @secret
      expect(response).to redirect_to "/users/#{session[:user_id]}"
    end
  end
end