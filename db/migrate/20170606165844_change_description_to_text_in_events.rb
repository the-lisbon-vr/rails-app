class ChangeDescriptionToTextInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :description, :text
  end
end
