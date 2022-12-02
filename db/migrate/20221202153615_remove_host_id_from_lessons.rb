class RemoveHostIdFromLessons < ActiveRecord::Migration[7.0]
  def change
    remove_column :lessons, :host_id, :bigint
  end
end
