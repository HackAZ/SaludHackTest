class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :insurance, :string
    add_column :users, :birthday, :date
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :address, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
