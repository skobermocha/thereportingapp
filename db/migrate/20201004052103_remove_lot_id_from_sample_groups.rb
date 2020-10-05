class RemoveLotIdFromSampleGroups < ActiveRecord::Migration[6.0]
  def change
  	safety_assured {remove_column :sample_groups, :lot_id}
  end
end
