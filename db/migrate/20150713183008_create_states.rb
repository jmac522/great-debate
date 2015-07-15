class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :abbreviation, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
