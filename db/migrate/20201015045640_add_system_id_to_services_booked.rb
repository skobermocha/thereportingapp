class AddSystemIdToServicesBooked < ActiveRecord::Migration[6.0]
  def change
  	add_column :services_booked, :system_id, :bigint
  end
end
