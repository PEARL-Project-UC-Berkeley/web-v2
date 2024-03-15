class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, foreign_key: true
      t.references :experiment, foreign_key: true
      t.string :purpose

      t.timestamps
    end
  end
end
