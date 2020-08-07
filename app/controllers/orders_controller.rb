class OrdersController < ApplicationController
  before_action :set_product, only: [:index]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, only: [:index]


  def index
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_root
    redirect_to root_path if current_user.id == @product.user_id
  end

end

