require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "#index" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :index
        expect(response).to be_success
      end

      it "returns a 200 response" do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#new" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "responds successfully" do
        sign_in @user
        get :new
        expect(response).to be_success
      end

      it "returns a 200 response" do
        sign_in @user
        get :new
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get :new
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "add a order" do
        order_params = FactoryBot.build(:order).attributes
        sign_in @user
        expect {
          post :create, params: { order: order_params }
        }.to change(@user.orders, :count).by(1)
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        order_params = FactoryBot.build(:order).attributes
        post :create, params: { order: order_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        order_params = FactoryBot.build(:order).attributes
        post :create, params: { order: order_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
