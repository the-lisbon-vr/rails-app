class SlotDurationToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :slot_duration_minutes, :integer, null: false
  end
end
