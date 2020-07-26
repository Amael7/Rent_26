class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.string :city
      t.float :price
      t.string :status
      t.string :location_delivery_to_start
      t.string :location_delivery_to_finish
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
