class AddPasswordToHosts < ActiveRecord::Migration[7.0]
  def change
    add_column :hosts, :password, :string
  end
end
