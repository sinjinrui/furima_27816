class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  postal_REGEX = /\A\d{3}[-]\d{4}\z/
  tel_REGEX = /\A\d{0,11}\z/

  with_options presence: true do
    validates :postal_code, format: { with: postal_REGEX }
    validates :shipping_origin_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :tel, format: { with: tel_REGEX }
  end

  belongs_to_active_hash :shipping_origin
  belongs_to :order, optional: true
end
