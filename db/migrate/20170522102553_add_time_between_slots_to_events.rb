class AddTimeBetweenSlotsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :time_between_slots, :integer, null: false, default: 5
  end
end
