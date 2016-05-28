class CartedProductsController < ApplicationController
  def show
    @carted_product
  end

  def create
    @carted_product = CartedProduct.new(
      quantity: params[:quantity], 
      user_id: current_user.id, 
      product_id: params[:product_id],
      status: "carted")

    @carted_product.calc_prices(@calc.product.price)
    @carted_product.save

    flash[:success] = "Successfully added to cart."
    redirect_to "/cart"
  end
end
