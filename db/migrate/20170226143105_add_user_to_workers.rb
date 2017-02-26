class AddUserToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :user_id, :integer
    add_column :workers, :work_id, :integer
  end
end
