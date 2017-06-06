class AddEnglishDescriptionToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :description_en, :text
  end
end
