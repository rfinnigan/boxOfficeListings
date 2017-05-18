class Show < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :rooms, through: :performances
  validates :title, presence: true,
                    length: { minimum: 2 }
  validates :duration, presence: true
  validates :nationality, length: { maximum: 4 }
end
