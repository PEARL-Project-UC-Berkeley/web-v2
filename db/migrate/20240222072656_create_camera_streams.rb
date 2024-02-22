class CreateCameraStreams < ActiveRecord::Migration[7.1]
  def change
    create_table :camera_streams do |t|
      t.references :experiment, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
