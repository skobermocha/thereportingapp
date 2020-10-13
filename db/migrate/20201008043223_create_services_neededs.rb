class CreateServicesNeededs < ActiveRecord::Migration[6.0]
  def change
    create_table :services_neededs do |t|
      t.references :system
      t.references :service
      t.string :status

      t.timestamps
    end
  end
end
