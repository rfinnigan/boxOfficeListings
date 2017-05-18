class Performance < ApplicationRecord
  belongs_to :show
  belongs_to :room
  validates :date, presence: true
  validates :time, presence: true
  validates :room_id, presence: true
end
