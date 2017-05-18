# basic model for Rooms (sub venues) of a Venue
class Room < ApplicationRecord
  belongs_to :venue
  has_many :performances, dependent: :destroy
  has_many :shows, :through => :performances
  validates :roomName, presence: true,
                       length: { minimum: 2 },
                       uniqueness: { case_sensitive: false }

  # method to return the full Venue and Room name in the form Venue - Room
  def full_name
    Venue.find(venue_id).name + " - " + roomName
  end
end
