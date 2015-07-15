class CreateDebateSides < ActiveRecord::Migration
  def change
    create_table :debate_sides do |t|
      t.belongs_to :debate
      t.belongs_to :side
    end
  end
end
