class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.string :body, null: false
      t.integer :score, default: 0
      t.belongs_to :debate, null: false
      t.belongs_to :debate_participant, null: false
      t.belongs_to :side, null: false
      
      t.timestamps
    end
  end
end
