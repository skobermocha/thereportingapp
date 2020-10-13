class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :alteration
      t.references :user
      t.integer :user_created_id
      t.string :contact_name
      t.string :contact_phone
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
