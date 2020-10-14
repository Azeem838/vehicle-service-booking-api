class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    @appointments = @user.appointments

    render json: @appointments
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = @user.appointments.build(appointment_params)
    @service = @appointment.service

    if @appointment.save
      render json: { appointment: @appointment, service: @service }, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    unless @user === @appointment.user
      render json: 'This appointment does not belong to you', status: 403
      return 
    end
    
    if @appointment.destroy
      render json: {status: "successfully deleted!", appointment: @appointment}
    else
      render json: 'could not delete this appointment'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_params
    params.permit(:service_id, :start_time, :end_time)
  end
end
