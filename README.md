# README

# furima_27816 DB設計
## 購入時データ（カード番号・有効期限・CVC）はPay.jpトークンで生成

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|nickname|string|null: false|
|birthday|date|null: false|
|email|string|null: false|
### Association
- has_many :products
- has_many :orders

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|explanation|text|null: false|
|status_id|integer|null: false, foreign_key: true|
|delivery_fee_id|integer|null: false, foreign_key: true|
|shipping_origin_id|integer|null: false, foreign_key: true|
|until_shipping_id|integer|null: false, foreign_key: true|
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :until_shipping
- belongs_to :user
- belongs_to_active_hash :category

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|tel|string|null: false|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to_active_hash :prefecture
- belongs_to :product
- belongs_to :user

# ここからActive_hashデータ

## prefecture
|Column|Type|Options|
|------|----|-------|
|prefecture_name|string||

## category
|Column|Type|Options|
|------|----|-------|
|category_name|string||

## until_shipping
|Column|Type|Options|
|------|----|-------|
|until_shipping_day|string||

## delivery_fee
|Column|Type|Options|
|------|----|-------|
|delivery_fee_side|string||

## shipping_origin
|Column|Type|Options|
|------|----|-------|
|shipping_prefecture|string||

## status
|Column|Type|Options|
|------|----|-------|
|status_pattern|string||