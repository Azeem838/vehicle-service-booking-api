class ServicesController < ApplicationController
  before_action :set_service, only: %i[show update destroy]

  # GET /services
  def index
    @services = Service.all

    render json: @services
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def service_params
    params.require(:service).permit(:service_type, :allocated_time)
  end
end
