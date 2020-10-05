class CreateAlterationNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :alteration_notes do |t|
      t.references :alteration, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
