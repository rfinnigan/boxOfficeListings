class Show < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :rooms, through: :performances
  validates :title, presence: true,
                    length: { minimum: 2 }
  validates :duration, presence: true
  validates :nationality, length: { maximum: 4 }

  # method to set default show length to 1 hr if not set during initialize
  after_initialize do |show|
      show.duration ||= 60
  end

  # Class method to find a show by name and return it
  # If no show by that name exists it creates a new show with the passed attributes.
  def self.find_or_create(attributes = {})
    find_by(title: attributes[:title]) || Show.create(attributes)
  end

  # method to return the nationality in brackets if it exists
  def bracketed_nationality
    return if nationality.nil?
    '(' + nationality + ')'
  end
end
