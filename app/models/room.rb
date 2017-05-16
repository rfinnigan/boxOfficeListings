class Room < ApplicationRecord
  belongs_to :venue
  has_many :shows
  validates :roomName, presence: true,
                       length: { minimum: 2 },
                       uniqueness: { case_sensitive: false }
end
