class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.string :artist
      t.string :title
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
