class Appointment < ApplicationRecord
  belongs_to :coach

  VALID_MINUTES = [0, 30].freeze

  validates :email, presence: true, format: { with: /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z/, message: 'must be a valid format' }
  # 1 appointment for a coaches available time.
  validates :start_time, uniqueness: { scope: :coach_id }
  validate :start_time_in_future
  validate :start_time_has_valid_minute
  validate :within_coaches_availability

  scope :for_date_time_start, -> (date_time_start) { where(start_time: date_time_start...(date_time_start + 1.day)) }

  private

  def start_time_in_future
    errors.add(:start_time, "can't be in the past") unless start_time.future?
  end

  def start_time_has_valid_minute
    errors.add(:start_time, 'minute must be 0 or 30') unless VALID_MINUTES.include? start_time.min
  end

  def within_coaches_availability
    # TODO
  end
end
