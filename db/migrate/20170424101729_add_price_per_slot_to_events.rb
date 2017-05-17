class AddPricePerSlotToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :price_per_slot, :float, null: false
  end
end
