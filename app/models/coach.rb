class Coach < ApplicationRecord
  has_many :available_weekdays, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :time_zone, presence: true
  validates :time_zone_string, presence: true
  validate :valid_time_zone

  private

  def valid_time_zone
    errors.add(:time_zone, 'must be valid') unless ActiveSupport::TimeZone[time_zone].present?
  end
end
