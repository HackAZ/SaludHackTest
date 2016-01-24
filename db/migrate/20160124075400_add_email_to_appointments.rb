class AddEmailToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :email, :string
  end
end
