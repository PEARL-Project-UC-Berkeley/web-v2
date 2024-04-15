class AddNewControls < ActiveRecord::Migration[7.1]
  def change
    create_table :control_positions do |t|
      t.references :experiment, null: false, foreign_key: true
      t.integer :x_min
      t.integer :x_max
      t.integer :x_step
      t.integer :y_min
      t.integer :y_max
      t.integer :y_step
      t.integer :z_min
      t.integer :z_max
      t.integer :z_step
      t.boolean :three_d
      t.string :label
    
      t.timestamps
    end

    create_table :control_push_buttons do |t|
      t.references :experiment, null: false, foreign_key: true
      t.string :label
    
      t.timestamps
    end

    create_table :control_inputs do |t|
      t.references :experiment, null: false, foreign_key: true
      t.integer :min
      t.integer :max
      t.integer :step
      t.string :label
    
      t.timestamps
    end
  end
end
