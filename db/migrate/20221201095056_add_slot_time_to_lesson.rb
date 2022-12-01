class AddSlotTimeToLesson < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :start_time, :datetime
    add_column :lessons, :end_time, :datetime
  end
end
