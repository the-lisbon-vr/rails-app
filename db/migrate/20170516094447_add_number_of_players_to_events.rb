class AddNumberOfPlayersToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :number_of_players, :integer, null: false, default: 2
  end
end
