class AddWorkToOverallChecks < ActiveRecord::Migration[5.0]
  def change
    add_column :overall_checks, :work_id, :integer
  end
end
