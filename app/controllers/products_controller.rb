class ProductsController < ApplicationController
  def index
    @products = Product.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    sale = params[:sale]

    if sale
      @products = @products.where("price < ?", sale)
    end

    if sort && sort_order
      @products = @products.order(sort => sort_order) #Use hash rocket because it is not a symbol
    elsif sort
      @products = @products.order(order) 
    else 
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def random
    @product = Product.all.sample

    redirect_to "/store/#{@product.id}"
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
