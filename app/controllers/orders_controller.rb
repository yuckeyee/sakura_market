class OrdersController < ApplicationController

  def new
    @cart_items = current_cart.cart_items
  end
end
