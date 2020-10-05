class CreateAlterations < ActiveRecord::Migration[6.0]
  def change
    create_table :alterations do |t|
      t.bigint :owner_id
      t.string :name
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :jurisdiction
      t.string :permit_number
      t.string :ho_name
      t.string :ho_phone
      t.string :ho_email
      t.string :building_type
      t.string :dwelling_unit_name
      t.integer :dwelling_unit_cfa
      t.string :climate_zone
      t.string :bedroom_count

      t.timestamps
    end
  end
end
