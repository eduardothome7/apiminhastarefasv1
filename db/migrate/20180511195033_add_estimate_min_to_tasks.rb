class AddEstimateMinToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :estimate_min, :decimal
  end
end
