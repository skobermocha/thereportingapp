class AddContractInfoToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :contract_status, :string
  end
end
