class CarsController < ApplicationController
  before_action :set_car, only: [:show]

  def index
    @cars = Car.all
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {car: car}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end
end
