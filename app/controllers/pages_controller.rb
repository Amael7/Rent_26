class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cars = Car.all
    @reservation = Reservation.new
  end

  def contact
  end
end
