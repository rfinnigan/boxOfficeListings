class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :roomName
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
