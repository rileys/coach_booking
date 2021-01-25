class CoachesController < ApplicationController
  def index
    @coaches = Coach.order(:name)
  end

  def calendar
    @coach = Coach.find(params[:id])
    @weekdays = AvailableWeekday.where(coach: @coach).uniq.pluck(:weekday)
  end

  def availability_for_date
    @date = params[:date].to_date
    @coach = Coach.find(params[:id])
    @available_weekdays = AvailableWeekday.where(coach: @coach, weekday: @date.wday).order(:start_time)
    @date_in_zone = @date.in_time_zone(@coach.time_zone)

    @booked_appointment_start_times = @coach.appointments.for_date_time_start(@date_in_zone).pluck(:start_time)
  end
end
