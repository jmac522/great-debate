class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, { null: false, unique: true }
      t.string :category, null: false
      t.timestamps
    end
  end
end
