class AddReoccuranceToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :reoccur, :integer
  end
end
