class UpdateSampleGroups < ActiveRecord::Migration[6.0]
  def change
  	safety_assured {remove_column :sample_groups, :project_id}
  	add_column :lots, :sample_group_id, :bigint
  end
end
