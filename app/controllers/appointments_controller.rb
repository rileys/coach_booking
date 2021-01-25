class AppointmentsController < ApplicationController
  def new
    @coach = Coach.find(params[:coach_id])
    @appointment = @coach.appointments.build(start_time: params[:start_time])
  end

  def create
    @coach = Coach.find(params[:coach_id])
    @appointment = @coach.appointments.build(appointment_params)

    if @appointment.save
      flash.now[:notice] = 'Congratulations! You have booked an appointment.'
      render :show
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:email, :start_time)
  end
end
