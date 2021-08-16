class ProductsController < ApplicationController
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy] 
  
  def landing
    @products = Product.all
    @reviews = Review.all
    render :landing
  end

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created!"
      redirect_to products_path      
    else
      flash[:alert] = "Product was not created."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Product was not updated."
      render :edit
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end