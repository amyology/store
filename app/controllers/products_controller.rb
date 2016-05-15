class ProductsController < ApplicationController
  def index
    @products =  Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new

  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      inventory: params[:inventory]
    )

    flash[:success] = "Successfully created."
    redirect_to "/store/#{@product.id}"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      inventory: params[:inventory]
    )

    flash[:success] = "Successfully updated."
    redirect_to "/store/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:warning] = "Successfully deleted."
    redirect_to "/"
  end
end
