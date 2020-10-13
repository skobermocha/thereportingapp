class CreateSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :systems do |t|
      t.references :alteration
      t.string :name
      t.string :area_served
      t.integer :cfa_served
      t.boolean :ducted_system
      t.boolean :new_refrigerant_components
      t.boolean :installing_new_components
      t.boolean :installing_40_ft_ducts
      t.boolean :entirely_new_system
      t.string :alteration_type
      t.references :heating_type
      t.string :altered_heating_component
      t.string :heating_efficiency_type
      t.string :heating_efficiency_value
      t.references :cooling_type
      t.string	:altered_cooling_component
      t.string :cooling_efficiency_type
      t.string :cooling_efficiency_value
      t.string :heating_make
      t.string :heating_model
      t.string :heating_serial
      t.integer :heating_capacity
      t.string :coil_make
      t.string :coil_model
      t.string :coil_serial
      t.integer :coil_capacity
      t.string :condenser_make
      t.string :condenser_model
      t.string :condenser_serial
      t.integer :condenser_capacity
      t.string :condenser_speed_type
      t.string :zonal_control_type
      t.boolean :new_ducts_installed
      t.integer :total_new_duct_length
      t.string :new_supply_location
      t.string :new_supply_rvalue
      t.string :new_return_location
      t.string :new_return_rvalue
      t.string :exception_to_min_rvalue
      t.string :airflow_method
      t.boolean :airflow_protocols_usable
      t.boolean :fanwatt_protocols_usable
      t.string :ductleakge_exemption
      t.boolean :ducts_in_garage

      t.timestamps
    end
  end
end
