class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change

	add_foreign_key :appointments, :alterations, validate: false

	add_foreign_key :systems, :alterations, validate: false

	add_foreign_key :services_neededs, :systems, validate: false

	add_foreign_key :services_bookeds, :appointments, validate: false
	add_foreign_key :services_neededs, :services, validate: false

	add_foreign_key :services_bookeds, :services, validate: false
  end
end
