class RemoveUsersFromHosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :hosts, :user_id, null: false, foreign_key: false
  end
end
