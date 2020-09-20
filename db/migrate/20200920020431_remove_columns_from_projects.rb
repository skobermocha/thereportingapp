class RemoveColumnsFromProjects < ActiveRecord::Migration[6.0]
  def change
  	safety_assured {remove_column :projects, :contract_status, :string}
  	safety_assured {remove_column :projects, :hvac_cf2r, :boolean}
  	safety_assured {remove_column :projects, :programs, :jsonb}
  	safety_assured {remove_column :projects, :project_type, :string}
  end
end
