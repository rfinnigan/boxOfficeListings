class AddDurationToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :duration, :integer
  end
end
