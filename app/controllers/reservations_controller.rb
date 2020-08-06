class ReservationsController < ApplicationController
  # before_action :set_reservation, only: [:new, :create]

  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
    @car = Car.find(params[:car_id])

    # la ligne 12 etait un test pour afficher quel voiture on choissisait pour le formulaire de creation d'un resa mais tu peux le supprimer si tu veux
    # @cars_name = @cars.map { |car| "#{car.brand} #{car.modele}"}
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @car = Car.find(params[:car_id])
    @reservation.car = @car
    @reservation.user = current_user
    dispo = true
    @car.reservations.each do |resa|
      @start = resa.date_start
      @end = resa.date_end
      if @reservation.date_start.between?(@start, @end) || @reservation.date_end.between?(@start, @end)
        flash.now[:notice] = "#{@car.brand} #{@car.modele} n'est pas disponible à ces dates"
        dispo = false
      end
    end
    # set_total_price

  #   if dispo == true && @reservation.save

  #     # session = Stripe::Checkout::Session.create(
  #     #   payment_method_types: ['card'],
  #     #   line_items: [{
  #     #     name: @nanny.first_name,
  #     #     images: [@nanny.photo],
  #     #     amount: @reservation.total_price_cents,
  #     #     currency: 'eur',
  #     #     quantity: 1
  #     #   }],
  #     #   success_url: reservations_url(@reservation),
  #     #   cancel_url: reservations_url(@reservation)
  #     # )

  #     # @reservation.update(checkout_session_id: session.id)

    redirect_to root_path
    # else
    #   @cars = Car.all
    #   render '../views/cars/index'
    # end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  # def set_total_price
  #   @days = (@reservation.end_date - @reservation.start_date).to_i
  #   @reservation.total_price_cents = @days * @reservation.nanny.price_per_day_cents * 100
  # end

  # def set_reservation
  #   @reservation = Reservation.find(params[:reservation_id])
  # end

  def reservation_params
    params.require(:reservation).permit(:user_id, :car_id, :city, :status, :location_delivery_to_start, :location_delivery_to_finish, :date_start, :date_end, :price)
  end
end
