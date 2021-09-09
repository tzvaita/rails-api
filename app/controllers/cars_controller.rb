class CarsController < ApplicationController

  before_action :set_car, only: [:show, :update, :destroy]

  def index
    @cars = Car.all
    render json: @cars
  end

  def create
    @car = Car.create!(car_params)
    render json: @car
  end

  def show
    render json: @car
  end

  def update
    @car.update(car_params)
    head :no_content
  end

  def destroy
    @car.destroy
    head :no_content
  end

  private

  def car_params
    params.permit(:make, :model)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
