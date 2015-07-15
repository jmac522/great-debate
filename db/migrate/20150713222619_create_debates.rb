class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.belongs_to :topic, null: false
      t.string :turn

      t.timestamps
    end
  end
end
