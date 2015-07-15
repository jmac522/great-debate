class AddCityAndStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state_id, :integer
    add_column :users, :city_id, :integer
  end
end
