class Performance < ApplicationRecord
  belongs_to :show
  belongs_to :room
  validates :date, presence: true
  validates :time, presence: true,
                   uniqueness: { scope: %i[date room],
                                 message: 'another performance is scheduled at
                                 this date and time in this room' }
  validates :room, presence: true
  validates :show, presence: true
end
