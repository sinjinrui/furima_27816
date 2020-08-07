class AddShippingOriginToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :shipping_origin, :integer
  end
end
