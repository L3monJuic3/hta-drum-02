class DropHosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :hosts, force: :cascade
  end
end
