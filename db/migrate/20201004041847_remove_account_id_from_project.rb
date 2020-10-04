class RemoveAccountIdFromProject < ActiveRecord::Migration[6.0]
  def change
  	safety_assured {remove_column :projects, :account_id}
  	add_column :projects, :owner_id, :bigint
  end
end
