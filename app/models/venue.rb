# model for a Venue
class Venue < ApplicationRecord
  validates :name, presence: true,
                   length: { minimum: 5 },
                   uniqueness: { case_sensitive: false }
end
