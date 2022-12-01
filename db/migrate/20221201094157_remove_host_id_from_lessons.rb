class RemoveHostIdFromLessons < ActiveRecord::Migration[7.0]
  def change
    remove_index :lessons, name: "index_lessons_on_host_id"
  end
end
