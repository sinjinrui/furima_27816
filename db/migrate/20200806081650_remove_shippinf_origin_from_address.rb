class RemoveShippinfOriginFromAddress < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :shipping_origin, :integer
  end
end
