class AddSomeDataToUserModel < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday_date, :string
    add_column :users, :phone_number, :string
  end
end
