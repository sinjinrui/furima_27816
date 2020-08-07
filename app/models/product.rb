class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :status_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :delivery_fee_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :shipping_origin_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :until_shipping_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :price, numericality: { greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9999999,
                                      message: '¥300から¥9,999,999の範囲で入力してください'}
    validates :user_id
    validates :category_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :image
  end

  belongs_to :user
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :until_shipping
  belongs_to_active_hash :category
  has_one :order

end
