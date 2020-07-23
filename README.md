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
|birthday|integer|null: false|
|email|string|null: false|
|password|string|null: false
### Association
- has_many :products
- has_many :orders

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|status_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|shipping_origin_id|integer|null: false|
|until_shipping_id|integer|null: false|
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false|
### Association
- belongs_to :user
- has_one :purchase

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|tel|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :purchase

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product