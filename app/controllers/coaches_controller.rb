class CoachesController < ApplicationController
  def index
    @coaches = Coach.order(:name)
  end

  def calendar
    @coach = Coach.find(params[:id])
    @weekdays = AvailableWeekday.where(coach: @coach).uniq.pluck(:weekday)
  end
end
