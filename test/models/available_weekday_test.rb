require 'test_helper'

class AvailableWeekdayTest < ActiveSupport::TestCase
  test 'has a valid factory' do
    available_weekday = build(:available_weekday)
    assert available_weekday.valid?
  end

  test 'weekday must be included with a value 0 to 6 inclusive' do
    available_weekday = build(:available_weekday, weekday: 7)
    refute available_weekday.valid?
    assert_not_nil available_weekday.errors[:weekday]

    available_weekday.weekday = -1
    refute available_weekday.valid?
    assert_not_nil available_weekday.errors[:weekday]

    available_weekday.weekday = 6
    assert available_weekday.valid?
  end

  test 'start_time must have a minute of 0 or 30' do
    start_time = Time.new.change(hour: 12, min: 10)
    available_weekday = build(:available_weekday, start_time: start_time, end_time: Time.new.change(hour: 17, min: 0))

    refute available_weekday.valid?
    assert_not_nil available_weekday.errors[:start_time]

    available_weekday.start_time = Time.new.change(hour: 12, min: 0)
    assert available_weekday.valid?

    available_weekday.start_time = Time.new.change(hour: 12, min: 30)
    assert available_weekday.valid?
  end

  test 'end_time must have a minute of 0 or 30' do
    end_time = Time.new.change(hour: 17, min: 10)
    available_weekday = build(:available_weekday, start_time: Time.new.change(hour: 9, min: 0), end_time: end_time)

    refute available_weekday.valid?
    assert_not_nil available_weekday.errors[:end_time]

    available_weekday.end_time = Time.new.change(hour: 12, min: 0)
    assert available_weekday.valid?

    available_weekday.end_time = Time.new.change(hour: 12, min: 30)
    assert available_weekday.valid?
  end

  test 'end_time is greater than start_time' do
    available_weekday = build(:available_weekday)
    available_weekday.end_time = available_weekday.start_time - 1.hour

    refute available_weekday.valid?
    assert_not_nil available_weekday.errors[:end_time]

    available_weekday.end_time = available_weekday.start_time + 30.minutes
    assert available_weekday.valid?
  end

  # TODO
  # test "times do not overlap for same coach"
  # test "times can overlap for different coaches"
end
