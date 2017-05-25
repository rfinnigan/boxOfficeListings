# model for a Venue
class Venue < ApplicationRecord
  require 'csv'

  has_many :rooms, dependent: :destroy
  accepts_nested_attributes_for :rooms
  validates :name, presence: true,
                   length: { minimum: 2 },
                   uniqueness: { case_sensitive: false }
end
