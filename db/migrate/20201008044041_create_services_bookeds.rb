class CreateServicesBookeds < ActiveRecord::Migration[6.0]
  def change
    create_table :services_bookeds do |t|
      t.references :appointment
      t.references :service
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
