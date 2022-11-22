class AddEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :email,              null: false, default: ""
      add_index :users, :email,                unique: true
    end
  end
end
