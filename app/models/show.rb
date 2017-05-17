class Show < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :rooms, :through => :performances
  validates :title, presence: true,
                    length: { minimum: 2 }
end
