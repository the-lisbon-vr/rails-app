class AddConfirmedToSlots < ActiveRecord::Migration[5.0]
  def change
    add_column :slots, :confirmed, :boolean, default: false
  end
end
