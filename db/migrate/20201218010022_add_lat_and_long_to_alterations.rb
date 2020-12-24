class AddLatAndLongToAlterations < ActiveRecord::Migration[6.0]
  def change
  	add_column :alterations, :latitude, :decimal
  	add_column :alterations, :longitude, :decimal
  end
end
