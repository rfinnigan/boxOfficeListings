# model for a Venue
class Venue < ApplicationRecord
  require 'csv'

  has_many :rooms, dependent: :destroy
  accepts_nested_attributes_for :rooms
  validates :name, presence: true,
                   length: { minimum: 2 },
                   uniqueness: { case_sensitive: false }

  # Class method to find a venue by name and return it
  # If no venue by that name exists it creates a new venue
  # with the passed attributes.
  def self.find_or_create(attributes = {})
    find_by(name: attributes[:name]) || Venue.create(attributes)
  end
end
