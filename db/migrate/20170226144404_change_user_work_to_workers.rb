class ChangeUserWorkToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_index :workers, [:user_id, :work_id], :unique => true
  end
end
