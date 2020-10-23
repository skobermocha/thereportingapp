class RemoveAlteredCompononentTypeFromSystems < ActiveRecord::Migration[6.0]
  def change
  	safety_assured {remove_column :systems, :altered_cooling_component}
  	safety_assured {remove_column :systems, :altered_heating_component}
  end
end
