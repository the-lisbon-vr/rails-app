class ChangeTimeFormatInSlots < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :start_time, :time
  end
end
