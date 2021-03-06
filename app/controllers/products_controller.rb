class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @category = Category.all
    render_403 if current_user.position != 'Фермер'
    @product = Product.new
  end

  def edit
    @category = Category.all
    render_403 if current_user.position != 'Фермер'
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to user_path(current_user)
    else
      render action: 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to user_path(current_user)
    else
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy

    redirect_to user_path(current_user)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :icon)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
