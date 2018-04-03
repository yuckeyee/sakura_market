class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def new
    @cart_items = current_cart.cart_items
  end

  def create
    order = current_user.orders.create!(order_params)
    current_cart.cart_items.each do |cart_item|
      subtotal = cart_item.item.price * cart_item.quantity
      order.order_details.create!(item_id: cart_item.item_id, quantity: cart_item.quantity, subtotal: subtotal)
    end
    session[:cart_id] = nil
    redirect_to root_path, flash: {success: '注文が完了しました'}
  end

  private

    def order_params
      params.require(:order).permit(:total, :postage, :payment_id, :ship_time_id, :delivery)
    end
end
