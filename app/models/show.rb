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
end
