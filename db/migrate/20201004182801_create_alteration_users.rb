class CreateAlterationUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :alteration_users do |t|
      t.references :account, null: false, foreign_key: true
      t.references :alteration, null: false, foreign_key: true

      t.timestamps
    end
  end
end
