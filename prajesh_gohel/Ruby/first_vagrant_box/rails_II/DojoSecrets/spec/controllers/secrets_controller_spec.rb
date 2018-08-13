require "rails_helper"
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create(:user)
    @user2 = create(:user, email: "anotheremail@gmail.com")
    @secret = create(:secret, user: @user)
    @secret2 = create(:secret, user: @user2)
  end

  context "when not logged in" do
    before do
      session[:user_id] = nil
    end

    it "cannot access index" do
      get :index
      expect(response).to redirect_to "/sessions/new"
    end

    it "cannot access create" do
      get :create
      expect(response).to redirect_to "/sessions/new"
    end

    it "cannot access destroy" do
      get :create, id: @user
      expect(response).to redirect_to "/sessions/new"
    end
  end

  context "when signed in as the wrong user" do
    before do
      session[:user_id] = @user2
    end

    it "cannot destroy another user's secret" do
      delete :destroy, id: @secret
      expect(response).to redirect_to "/users/#{session[:user_id]}"
    end
  end
end
