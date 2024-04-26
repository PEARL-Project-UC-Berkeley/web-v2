class AddHomepageColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :image, :string
    add_column :users, :name, :string
    add_column :users, :description, :string
    add_column :experiments, :image, :string
    add_column :experiments, :description, :string
  end
end
