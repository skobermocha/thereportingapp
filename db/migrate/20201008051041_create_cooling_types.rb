class CreateCoolingTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cooling_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
