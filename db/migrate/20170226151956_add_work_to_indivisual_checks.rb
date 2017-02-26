class AddWorkToIndivisualChecks < ActiveRecord::Migration[5.0]
  def change
    add_column :indivisual_checks, :work_id, :integer
  end
end
