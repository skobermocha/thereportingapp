class CreatePlanTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_types do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.string :xml_store
      t.jsonb :hers
      t.boolean :model_test

      t.timestamps
    end
  end
end
