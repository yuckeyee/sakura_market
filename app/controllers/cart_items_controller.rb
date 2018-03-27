class CartItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @cart_items = current_cart.cart_items
  end

  def create
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id].to_i)
    @cart_item = current_cart.cart_items.build(item_id: params[:item_id].to_i) if @cart_item.blank?
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save!
    redirect_to root_path, flash: {success: '追加しました！'}
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path, flash: {success: '削除しました！'}
  end
end
