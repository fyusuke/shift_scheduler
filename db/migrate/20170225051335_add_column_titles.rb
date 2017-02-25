class AddColumnTitles < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string    
    add_column :users, :phone, :integer
    add_column :users, :age, :integer
    add_column :users, :address, :string    
    add_column :users, :picture, :string
    add_column :users, :fake?, :boolean
  end

  def down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string    
    remove_column :users, :phone, :integer
    remove_column :users, :age, :integer
    remove_column :users, :address, :string    
    remove_column :users, :picture, :string
    remove_column :users, :fake?, :boolean
  end
end