class CreatePearlMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :pearl_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :description
      t.boolean :current_member
      t.string :role

      t.timestamps
    end
  end
end
