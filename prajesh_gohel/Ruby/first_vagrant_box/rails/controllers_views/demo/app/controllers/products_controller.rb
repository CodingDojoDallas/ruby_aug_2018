class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.create( name: params[:name], description: params[:description])
    redirect_to '/'
    puts "\n"+@product.inspect+"\n"
  end

  def new
  end
end
