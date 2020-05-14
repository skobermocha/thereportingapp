class CreateLots < ActiveRecord::Migration[6.0]
  def change
    create_table :lots do |t|
      t.references :project, null: false, foreign_key: true
      t.string :permit
      t.string :phase
      t.string :lot
      t.string :address
      t.references :plan_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
