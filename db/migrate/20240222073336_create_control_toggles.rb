class CreateControlToggles < ActiveRecord::Migration[7.1]
  def change
    create_table :control_toggles do |t|
      t.references :experiment, null: false, foreign_key: true
      t.boolean :on
      t.string :label

      t.timestamps
    end
  end
end
