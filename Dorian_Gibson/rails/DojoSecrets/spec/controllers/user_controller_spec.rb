require "rails_helper"
RSpec.describe UsersController, type: :controller do
  before do
    @user = create(:user)
    @user2 = create(:user, email: "anotheremail@gmail.com")
  end

  context "when not logged in" do
    before do
      session[:user_id] = nil
    end

    it "cannot access show" do
      get :show, id: @user
      expect(response).to redirect_to "/sessions/new"
    end

    it "cannot access edit" do
      get :edit, id: @user
      expect(response).to redirect_to "/sessions/new"
    end

    it "cannot access update" do
      get :update, id: @user
      expect(response).to redirect_to "/sessions/new"
    end

    it "cannot access destroy" do
      get :destroy, id: @user
      expect(response).to redirect_to "/sessions/new"
    end
  end

  context "when signed in as the wrong user" do
    before do
      session[:user_id] = @user2
    end
    it "cannot access profile page for another user" do
      get :show, id: @user
      expect(response).to redirect_to "/users/#{session[:user_id]}"
    end
    it "cannot access the edit page of another user" do
      get :edit, id: @user
      expect(response).to redirect_to "/users/#{session[:user_id]}"
    end
    it "cannot update another user" do
      get :update, id: @user
      expect(response).to redirect_to "/users/#{session[:user_id]}"
    end
    it "cannot destroy another user" do
      get :destroy, id: @user
      expect(response).to redirect_to "/users/#{session[:user_id]}"
    end
  end
  
end