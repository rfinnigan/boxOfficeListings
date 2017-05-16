class CreatePerformances < ActiveRecord::Migration[5.1]
  def change
    create_table :performances do |t|
      t.date :date
      t.time :time
      t.integer :duration

      t.timestamps
    end
  end
end
