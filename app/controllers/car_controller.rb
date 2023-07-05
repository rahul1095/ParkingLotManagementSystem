class CarsController < ApplicationController
  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def by_color
    @cars = Car.where(color: params[:color])
    render json: @cars.pluck(:registration_number)
  end

  private

  def car_params
    params.require(:car).permit(:registration_number, :color)
  end
end
