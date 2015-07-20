class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :debate_participant
      t.belongs_to :argument
      t.integer :value, default: 1

      t.timestamps
    end
  end
end
