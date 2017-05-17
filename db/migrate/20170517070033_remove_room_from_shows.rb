class RemoveRoomFromShows < ActiveRecord::Migration[5.1]
  def change
    remove_reference :shows, :room, foreign_key: true
  end
end
