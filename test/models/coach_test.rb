require 'test_helper'

class CoachTest < ActiveSupport::TestCase
  test 'has a valid factory' do
    coach = build(:coach)
    assert coach.valid?
  end

  test 'invalid without real time zone' do
    coach = build(:coach, time_zone: 'Something made up')
    refute coach.valid?
  end
end
