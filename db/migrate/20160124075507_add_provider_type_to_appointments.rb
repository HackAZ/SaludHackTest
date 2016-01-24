class AddProviderTypeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :provider_type, :string
  end
end
