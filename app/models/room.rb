class Room < ApplicationRecord
  belongs_to :venue
  has_many :shows
end
