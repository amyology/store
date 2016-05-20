class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])
  end

  def new

  end

  def create
    @supplier = Supplier.create(name: params[:name], email: params[:email], phone: [:phone])

    redirect_to '/suppliers/#{supplier.id}'
  end
end
