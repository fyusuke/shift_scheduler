class CreateOverallChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :overall_checks do |t|

      t.timestamps
    end
  end
end
