# model for a Venue
class Venue < ApplicationRecord
  has_many :rooms
  accepts_nested_attributes_for :rooms
  validates :name, presence: true,
                   length: { minimum: 2 },
                   uniqueness: { case_sensitive: false }
end
