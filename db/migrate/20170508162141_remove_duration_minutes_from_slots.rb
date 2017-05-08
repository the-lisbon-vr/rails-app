class RemoveDurationMinutesFromSlots < ActiveRecord::Migration[5.0]
  def change
    remove_column :slots, :duration_minutes, :integer
  end
end
