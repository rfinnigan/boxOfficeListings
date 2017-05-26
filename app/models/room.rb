# basic model for Rooms (sub venues) of a Venue
class Room < ApplicationRecord
  belongs_to :venue
  has_many :performances, dependent: :destroy, inverse_of: :room
  has_many :shows, through: :performances, inverse_of: :room
  validates :roomName, presence: true,
                       length: { minimum: 2 },
                       uniqueness: { case_sensitive: false }

  # Class method to find a venue by name and return it
  # If no venue by that name exists it creates a new venue
  # with the passed attributes.
  def self.find_or_create(attributes = {})
    find_by(roomName: attributes[:room_name]) ||
      Room.create_with_venue_name(attributes)
  end

  # Class method to create a new room in a venue given the venues name.
  # If no venue of that name exists a new one will be created
  def self.create_with_venue_name(attributes = {})
    venue_id = Venue.find_or_create(name: attributes[:venue_name]).id
    room_attributes = { venue_id: venue_id, roomName: attributes[:room_name] }
    Room.create(room_attributes)
  end

  # method to return the full Venue and Room name in the form Venue - Room
  def full_name
    Venue.find(venue_id).name + '-' + roomName
  end
end
