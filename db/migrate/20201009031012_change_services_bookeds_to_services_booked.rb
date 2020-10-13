class ChangeServicesBookedsToServicesBooked < ActiveRecord::Migration[6.0]
  def change
  	safety_assured {rename_table :services_bookeds, :services_booked}
  	safety_assured {rename_table :services_neededs, :services_needed}
  end
end
