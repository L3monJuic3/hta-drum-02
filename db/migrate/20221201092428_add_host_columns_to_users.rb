class AddHostColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_host, :boolean
    add_column :users, :address, :string
  end
end