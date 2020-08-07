class RemoveUntilShippingToAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :until_shipping
  end
end
