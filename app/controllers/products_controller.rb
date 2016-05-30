class ProductsController < ApplicationController

before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    sale = params[:sale]
    category_name = params[:category_name]
    search_term = params[:search_term]

    if sort && sort_order
      @products = @products.order(sort => sort_order) #Use hash rocket because it is not a symbol
    elsif sort
      @products = @products.order(order)
    else 
      @products = Product.all
    end

    if search_term
      @products = @products.where("name ILIKE ? OR description ILIKE ?", "%#{search_term}%", "%#{search_term}%")
    end

    if category_name
      @products = Category.find_by(name: category_name).products
    end

    if sale
      @products = @products.where("price < ?", sale)
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
    @product = Product.new
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory]
    )

    if @product.save

      Image.create(src: params[:image], product_id: @product.id) if params[:image] != ""

      flash[:success] = "Successfully created."
      redirect_to "/store/#{@product.id}"

    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory]
    )

    if @product.save

      flash[:success] = "Successfully updated."
      redirect_to "/store/#{@product.id}"

    else 
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:warning] = "Successfully deleted."
    redirect_to "/"
  end

end
