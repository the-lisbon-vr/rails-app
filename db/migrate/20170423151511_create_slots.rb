class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :start_time
      t.integer :duration_minutes

      t.timestamps
    end
  end
end
