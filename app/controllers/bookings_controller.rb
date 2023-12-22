class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    @bookings = Booking.all
    @user_bookings = current_user.bookings || []
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user

    if @booking.starts_at.present? && @booking.ends_at.present?
      @booking.total_price = (@booking.ends_at - @booking.starts_at) * @car.price_per_day
    end

    @booking.accepted = true
    if @booking.save
      redirect_to car_path(@car), notice: 'Réservation réussie !'
    else
      flash.now[:alert] = 'Erreur lors de la réservation, veuillez réessayez.'
      render 'cars/show', status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :total_price)
  end
end
