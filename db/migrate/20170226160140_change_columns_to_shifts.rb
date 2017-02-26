class ChangeColumnsToShifts < ActiveRecord::Migration[5.0]
  def change
    remove_column :shifts, :work_id
    add_column :shifts, :worker_id, :integer
    add_index :shifts, [:worker_id, :ymd, :time], :unique => true
    change_column_default :shifts, :default?, 0
  end
end
