class Car < ApplicationRecord
  validates :price_per_day, presence: true
  validates :brand, presence: true
  validates :modele, presence: true
  validates :year, presence: true
  validates :km, presence: true
  validates :description, presence: true
  validates :power, presence: true
  validates :type_of_carburator, presence: true
  validates :number_of_place, presence: true
  validates :gear_lever, presence: true
end
