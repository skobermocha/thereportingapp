class AddTargetToServicesNeeded < ActiveRecord::Migration[6.0]
  def change
  	add_column :services_needed, :target, :string
  end
end
