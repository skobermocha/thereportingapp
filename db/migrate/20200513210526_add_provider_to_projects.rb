class AddProviderToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :provider, :string
    add_column :projects, :code_year, :string
    add_column :projects, :bill_at_frame, :boolean
    add_column :projects, :programs, :jsonb
    add_column :projects, :hvac_cf2r, :boolean
    add_column :projects, :total_lot_count, :integer
  end
end
