class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @product = Product.find(@order.product_id)
  end

  def create
    @order = Order.new(
      quantity: params[:quantity], 
      user_id: current_user.id, 
      product_id: params[:product_id])

    @order.calc_prices(@order.product.price)
    @order.save

    flash[:success] = "Success."
    redirect_to "/orders/#{@order.id}"
  end
end
