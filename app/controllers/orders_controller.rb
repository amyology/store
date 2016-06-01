class OrdersController < ApplicationController

  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.carted_products
    unless user_signed_in? && current_user.id == @order.user.id
      redirect_to '/'
    end
  end

  def create
    @order = Order.create(user_id: current_user.id)
    ordered_products = current_user.carted_items

    ordered_products.each do |item|
      item.update(status: 'purchased', order_id: @order.id)
    end

    @order.calc_prices(@order.carted_products)
    @order.save

    session[:cart_count] = nil
    flash[:success] = "Success."
    redirect_to "/orders/#{@order.id}"
  end

end
