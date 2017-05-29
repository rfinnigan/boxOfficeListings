class Performance < ApplicationRecord
  belongs_to :show
  belongs_to :room
  validates :date, presence: true
  validates :time, presence: true
  validates :room, presence: true
  validates :show, presence: true
  validate :cannot_overlap_another_perf

  scope :date, (->(date) { where('(date is ?)', date) })

  scope :exclude_self, (->(id) { where.not(id: id) })

  def end_time
    time + show.duration * 60
  end

  def cannot_overlap_another_perf
    return if room.blank?
    range = Range.new time, end_time
    room.performances.date(date).exclude_self(id).each do |other_perf|
      overlap_error if range.overlaps?(other_perf.time..other_perf.end_time)
    end
  end

  def overlap_error
    errors.add(:overlap_error, 'There is already an event scheduled at
                                this time and date in this room!')
  end
end
