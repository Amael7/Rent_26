class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  # def show
  #   @car = Car.find(params[:id])
  # end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params_car)
    if @car.save
      redirect_to cars_path
    else
      render 'new'
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def params_car
    params.require(:car).permit(:price_per_day, :brand, :modele, :year, :km, :photo, :description, :power, :type_of_carburator, :number_of_place, :gear_lever)
  end
end
