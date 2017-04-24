class AddPricePerSlotToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :price_per_slot, :float
  end
end
