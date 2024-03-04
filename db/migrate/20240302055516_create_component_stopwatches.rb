class CreateComponentStopwatches < ActiveRecord::Migration[7.1]
  def change
    create_table :component_stopwatches do |t|
      t.references :experiment, null: false, foreign_key: true
      t.string :label
    
      t.timestamps
    end
  end
end
