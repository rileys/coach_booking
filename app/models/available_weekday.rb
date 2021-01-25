class AvailableWeekday < ApplicationRecord
  belongs_to :coach

  VALID_MINUTES = [0, 30].freeze

  validates :weekday, presence: true, inclusion: { in: 0..6 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :times_have_valid_minute

  private

  def times_have_valid_minute
    errors.add(:start_time, 'minute must be 0 or 30') unless VALID_MINUTES.include? start_time.min
    errors.add(:end_time, 'minute must be 0 or 30') unless VALID_MINUTES.include? end_time.min
  end
end
