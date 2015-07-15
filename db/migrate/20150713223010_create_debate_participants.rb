class CreateDebateParticipants < ActiveRecord::Migration
  def change
    create_table :debate_participants do |t|
      t.belongs_to :user, null: false
      t.belongs_to :side, null: false
      t.belongs_to :debate, null: false
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
