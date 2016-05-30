class CartedProductsController < ApplicationController

before_action :authenticate_user!

  def index
    @cart = current_user.carted_items

    if user_signed_in? && current_user.carted_items.count > 0
      @cart = current_user.carted_items
    else
      flash[:info] = "No items in cart"
      redirect_to '/'
    end
  end

  def create
    @carted_product = CartedProduct.new(
      quantity: params[:quantity], 
      user_id: current_user.id, 
      product_id: params[:product_id],
      status: "carted")

    # @carted_product.calc_prices(@calc.product.price)
    @carted_product.save

    flash[:success] = "Added to cart."
    redirect_to "/cart"
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")

    flash[:success] = "Item Removed"
    redirect_to '/cart'
  end

end
