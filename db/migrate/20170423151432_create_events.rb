class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :location
      t.string :description
      t.integer :max_bookings

      t.timestamps
    end
  end
end
