class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :cal_cart_count #can use only: [:index, :new, :show, :edit, :random] or can use except: [:destroy, :create]

private

  def cal_cart_count
    if user_signed_in?
      @cart_count = current_user.carted_items.count
    else 
      @cart_count = 0
    end
  end

  def authenticate_admin!
    unless user_signed_in? && current_user.admin
      redirect_to '/'
    end
  end

end
