# model for a Venue
class Venue < ApplicationRecord
  require 'csv'

  has_many :rooms, dependent: :destroy
  accepts_nested_attributes_for :rooms
  validates :name, presence: true,
                   length: { minimum: 2 },
                   uniqueness: { case_sensitive: false }
  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a venue for each row in the CSV file
      Venue.create! row.to_hash
    end
  end
end
