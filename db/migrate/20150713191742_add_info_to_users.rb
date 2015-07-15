class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: "user"
    add_column :users, :xp, :integer, default: 0
    add_column :users, :rank, :string, default: "Noob"
  end
end
