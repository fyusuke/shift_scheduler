class AddColumnsToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :admin, :boolean
    add_column :workers, :first_day, :string
    add_column :workers, :skill_values, :string
  end
end
