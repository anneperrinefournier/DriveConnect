class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @user_cars = current_user.cars
    @user_bookings = current_user.bookings
  end
end
