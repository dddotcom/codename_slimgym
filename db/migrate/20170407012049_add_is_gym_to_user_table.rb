class AddIsGymToUserTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :isGym, :boolean, default: false
  end
end
