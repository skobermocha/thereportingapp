class AddCheersIdToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :cheers_id, :string
  end
end
