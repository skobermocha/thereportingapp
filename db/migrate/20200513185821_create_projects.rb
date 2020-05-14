class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.string :zipcode
      t.string :climate_zone
      t.string :jurisdiction
      t.string :project_type
      t.text :description
      t.string :utility_electricity
      t.string :utility_gas
      t.boolean :active
      t.string :file_share
      t.references :account

      t.timestamps
    end
    add_index :projects, :name
    add_index :projects, :project_type
  end
end
