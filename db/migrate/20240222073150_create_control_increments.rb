class CreateControlIncrements < ActiveRecord::Migration[7.1]
  def change
    create_table :control_increments do |t|
      t.references :experiment, null: false, foreign_key: true
      t.integer :min
      t.integer :max
      t.integer :step
      t.string :label

      t.timestamps
    end
  end
end
