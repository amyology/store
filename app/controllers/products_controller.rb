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
    render 'show.html.erb'
  end
end
