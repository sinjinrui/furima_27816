class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :order]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :order, :order]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_root, only: [:show]
  
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

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def order
    console.log(ENV["PAYJP_SECRET_KEY"])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: params[:card_token],
      currency: 'jpy'
    )
    @address = Address.new(order_params)
    if @address.save!
      product_order = Order.new(user_id: current_user.id, product_id: @product.id, address_id: @address.id)
      if product_order.save!
        redirect_to root_path
      else
        redirect_to product_orders_path(@product)
      end
    else
      redirect_to product_orders_path(@product)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :explanation, :status_id,
                                    :delivery_fee_id, :shipping_origin_id, :until_shipping_id,
                                    :price, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  def move_to_index
    redirect_to action: :index unless current_user.id == @product.user_id
  end

  def order_params
    params.permit(
      :postal_code, :shipping_origin_id, :city, :house_number, :building_name, :tel
    )
  end

  def move_to_root
    redirect_to root_path if @product.order
  end

end
