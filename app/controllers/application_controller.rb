class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :current_cart

  rescue_from SecurityError do |_exception|
    redirect_to root_url, notice: 'アドミン画面へのアクセス権限がありません。'
  end

  # PERMISSIBLE_ATTRIBUTES = %i(post_code address)

  protected

  def authenticate_admin_user!
    raise SecurityError unless current_user.try(:admin?)
  end

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update, keys: [:post_code, :address])
  end

end
