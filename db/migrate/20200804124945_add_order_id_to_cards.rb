class AddOrderIdToCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :order, null: false, foreign_key: true
  end
end
