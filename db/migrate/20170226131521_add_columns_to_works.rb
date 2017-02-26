class AddColumnsToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :name, :string
    add_column :works, :phone, :string
    add_column :works, :address, :string
    add_column :works, :skill_items, :string
    add_column :works, :training_names, :string
    add_column :works, :qual_names, :string
  end
end
