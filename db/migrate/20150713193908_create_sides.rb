class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.string :title, { null: false, unique: true }
      t.integer :points, default: 0
      t.belongs_to :topic, null: false

      t.timestamps
    end
  end
end
