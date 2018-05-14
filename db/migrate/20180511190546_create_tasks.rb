class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :project_id
      t.integer :category_id
      t.integer :status_id
      t.datetime :start_at
      t.datetime :estimate_at
      t.datetime :closed_at
      t.text :description
      t.integer :priority

      t.timestamps
    end
  end
end
