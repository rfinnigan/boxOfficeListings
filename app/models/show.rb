class Show < ApplicationRecord
  belongs_to :room
  has_many :performances
  validates :title, presence: true,
                    length: { minimum: 2 }
end
