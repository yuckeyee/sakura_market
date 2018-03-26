require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe "#index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#add_item" do
    context "@cart_itemが存在しない時" do
      before do
        @item = FactoryBot.create(:item)
      end

      it "add a cart_item" do
        expect {
          post :add_item, params: { item_id: @item.id, quantity: 1 }
        }.to change(CartItem.all, :count).by(1)
      end
    end

    context "@cart_itemが存在する時" do
      before do
        @cart_item = FactoryBot.create(:cart_item)
      end

      it "add a order" do
        expect {
          post :add_item, params: { item_id: @cart_item.item.id, quantity: 1 }, session: { cart_id: @cart_item.cart.id}
        }.to change{@cart_item.reload.quantity}.by(1)
      end
    end
  end

  describe "#delete_item" do
    it "delete a cart_item" do
      @cart_item = FactoryBot.create(:cart_item)
      expect {
        delete :delete_item, params: { item_id: @cart_item.item.id }, session: { cart_id: @cart_item.cart.id}
      }.to change(CartItem.all, :count).by(-1)
    end
  end
end
