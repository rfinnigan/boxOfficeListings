class Show < ApplicationRecord
  has_many :performances, dependent: :destroy, inverse_of: :show
  has_many :rooms, through: :performances, inverse_of: :show
  validates :title, presence: true, unless: ->(show) { show.artist.present? },
                    length: { minimum: 2 },
                    uniqueness: { scope: :artist }
  validates :artist, presence: true, unless: ->(show) { show.title.present? },
                     length: { minimum: 2 },
                     uniqueness: { scope: :title }
  validates :duration, presence: true, numericality: { only_integer: true,
                                                       greater_than: 0 }
  validates :nationality, length: { maximum: 4 }

  # method to set default show length to 1 hr if not set during initialize
  after_initialize do |show|
    show.duration ||= 60
  end

  # Class method to find a show by name and return it
  # If no show by that name exists it creates a new show
  # with the passed attributes.
  def self.find_or_create(attributes = {})
    find_by(title: attributes[:title]) || Show.create(attributes)
  end

  # method to return the nationality in brackets if it exists
  def bracketed_nationality
    return unless nationality.present?
    '(' + nationality + ')'
  end

  # method to return artist if it exists otherwise title
  def artist_or_title
    artist || title
  end
end
