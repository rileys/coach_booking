class AvailableWeekday < ApplicationRecord
  belongs_to :coach

  VALID_MINUTES = [0, 30].freeze

  validates :weekday, presence: true, inclusion: { in: 0..6 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :times_have_valid_minute
  validate :end_time_greater_than_start_time
  validate :times_do_not_overlap

  private

  def times_have_valid_minute
    errors.add(:start_time, 'minute must be 0 or 30') unless VALID_MINUTES.include? start_time.min
    errors.add(:end_time, 'minute must be 0 or 30') unless VALID_MINUTES.include? end_time.min
  end

  def end_time_greater_than_start_time
    errors.add(:end_time, 'must be greater than start_time') unless end_time > start_time
  end

  def times_do_not_overlap
    if AvailableWeekday.where(coach_id: coach_id, weekday: weekday, start_time: start_time...end_time).present?
      errors.add(:start_time, 'must not fall within another available day')
    end
    if AvailableWeekday.where(coach_id: coach_id, weekday: weekday, end_time: start_time...end_time).present?
      errors.add(:end_time, 'must not fall within another available day')
    end
  end
end
