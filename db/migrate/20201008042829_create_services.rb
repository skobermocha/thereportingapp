class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :duration
      t.decimal :price
      t.boolean :active

      t.timestamps
    end
  end
end
