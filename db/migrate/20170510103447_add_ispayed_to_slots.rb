class AddIspayedToSlots < ActiveRecord::Migration[5.0]
  def change
    add_column :slots, :ispayed, :boolean, null: false, default: false
  end
end
