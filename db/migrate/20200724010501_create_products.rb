class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                 null: false
      t.text :explanation,            null: false
      t.integer :status_id,           null: false
      t.integer :delivery_fee_id,     null: false
      t.integer :shipping_origin_id,  null: false
      t.integer :until_shipping_id,   null: false
      t.string :price,                null: false
      t.integer :user_id,             null: false, foreign_key: true
      t.integer :category_id,         null: false
      t.timestamps
    end
  end
end
