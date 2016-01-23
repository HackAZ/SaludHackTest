class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :patient_name
      t.string :clinic_name
      t.string :days
      t.string :time_of_day
      t.text :description
      t.string :insurance

      t.timestamps null: false
    end
  end
end
