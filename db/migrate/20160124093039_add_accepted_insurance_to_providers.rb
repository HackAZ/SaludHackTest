class AddAcceptedInsuranceToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :accepted_insurance, :string
  end
end
