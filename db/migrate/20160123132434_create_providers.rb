class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.integer :rating
      t.string :provider_type
      t.string :specialization

      t.timestamps null: false
    end
  end
end
