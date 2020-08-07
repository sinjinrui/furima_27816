# class ProductOrder

#   include ActiveModel::Model
#   attr_accessor :postal_code, :shipping_origin_id, :city, :house_number, :building_name,:tel

#   postal_REGEX = /\A\d{3}[-]\d{4}\z/
#   tel_REGEX = /\A\d{0,11}\z/

#   with_options presence: true do
#     validates :postal_code, format: { with: postal_REGEX }
#     validates :shipping_origin_id, numericality: { other_than: 1 }
#     validates :city
#     validates :house_number
#     validates :tel, format: { with: tel_REGEX }
#   end
  
#   def save
#     @product = Product.find(params[:id])
#     @address = Address.create(postal_code: potal_code, shipping_origin_id: shipping_origin_id, city: city, house_number: house_number, building_name: building_name, tel: tel)
#     Order.create(user_id: current_user.id, product_id: @product.id, address_id: @address.id)
#   end
# end