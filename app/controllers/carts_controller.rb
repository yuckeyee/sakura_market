class CartsController < ApplicationController
  before_action :setup_cart_item, only: [:add_item, :delete_item]
  skip_before_action :authenticate_user!
  
  def index
    @cart_items = current_cart.cart_items
  end

  def add_item
    @cart_item = current_cart.cart_items.build(item_id: params[:item_id].to_i) if @cart_item.blank?
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save!
    redirect_to root_path, flash: {success: '追加しました！'}
  end

  def delete_item
    @cart_item.destroy
    redirect_to carts_path, flash: {success: '削除しました！'}
  end

  private

  def setup_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id].to_i)
  end
end
