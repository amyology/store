class CartedProductsController < ApplicationController

before_action :authenticate_user!

  def index
    @cart = current_user.carted_products.where(status: 'carted')

    if user_signed_in? && current_user.carted_items.count > 0
      @cart = current_user.carted_items
    else
      flash[:info] = "No items in cart"
      redirect_to '/'
    end
  end

  def create
    @carted_product = CartedProduct.create(
      quantity: params[:quantity], 
      user_id: current_user.id, 
      product_id: params[:product_id],
      status: "carted")

    session[:cart_count] = nil
    flash[:success] = "Added to cart."
    redirect_to "/cart"
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")

    session[:cart_count] = nil
    flash[:success] = "Item Removed"
    redirect_to '/cart'
  end

end
