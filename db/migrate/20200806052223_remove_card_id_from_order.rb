class RemoveCardIdFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :card, null: false
  end
end
