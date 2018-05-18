class AddClosedAtToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :closed_at, :datetime
  end
end
