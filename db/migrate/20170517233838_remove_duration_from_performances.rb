class RemoveDurationFromPerformances < ActiveRecord::Migration[5.1]
  def change
    remove_column :performances, :duration, :integer
  end
end
