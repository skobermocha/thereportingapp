class AddCheersIdToLot < ActiveRecord::Migration[6.0]
  def change
    add_column :lots, :cheers_id, :string
  end
end
