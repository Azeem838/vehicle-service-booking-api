class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    @appointments = @user.appointments.reverse

    render json: @appointments
  end

  # POST /appointments
  def create
    @appointment = @user.appointments.build(appointment_params)
    @service = @appointment.service

    if @appointment.save
      render json: { appointment: @appointment, service: @service, message: 'Service created successfully' }, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_params
    params.require(:appointment).permit(:service_id, :start_time, :end_time, :description)
  end
end
