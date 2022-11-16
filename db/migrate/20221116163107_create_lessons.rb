class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :price
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
