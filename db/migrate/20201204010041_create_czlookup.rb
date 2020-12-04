class CreateCzlookup < ActiveRecord::Migration[6.0]
  def change
    create_table :czlookups do |t|
      t.string :zipcode
      t.string :climatezone

      t.timestamps
    end
    add_index :czlookups, :zipcode
  end
end
