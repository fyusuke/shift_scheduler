class ChangeColumnToLines < ActiveRecord::Migration[5.0]
  def change
    add_index :lines, :line_id, unique: true
    add_index :users, :line_id, unique: true  
    add_index :users, :phone, unique: true
    add_index :works, :name, unique: true
    add_index :works, :phone, unique: true
    add_index :indivisual_checks, :work_id, unique: true
    add_index :overall_checks, :work_id, unique: true
    
  end
end
