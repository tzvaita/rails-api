class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
    render json: @appointments
  end

  def create
    @appointment = Appointment.create!(appointment_params)
    render json: @appointment
  end

  def show
    render json: @appointment
  end

  def update
    @appointment.update(appointment_params)
    head :no_content
  end

  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:make, :model)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
