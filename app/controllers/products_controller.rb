class ProductsController < ApplicationController
  before_action :require_login, only: [:new]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]
  
  def index
    @products = Product.all.order(id: "DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :status_id,
                                    :delivery_fee_id, :shipping_origin_id, :until_shipping_id,
                                    :price, :category_id, :image).merge(user_id: current_user.id)
  end

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  def move_to_index
    redirect_to action: :index unless current_user.id == @product.user_id
  end

end
