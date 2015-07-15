class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.string :title, null: false
      t.integer :points, default: 0
      t.belongs_to :topic, null: false

      t.timestamps
    end
  end
end
