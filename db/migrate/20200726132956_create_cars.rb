class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.float :price_per_day
      t.string :type
      t.string :brand
      t.string :modele
      t.integer :year
      t.integer :km
      t.boolean :status_disponibility
      t.string :photo
      t.text :description
      t.integer :power
      t.string :type_of_carburator
      t.integer :number_of_place
      t.string :gear_lever

      t.timestamps
    end
  end
end
