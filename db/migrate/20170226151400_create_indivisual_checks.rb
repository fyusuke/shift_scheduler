class CreateIndivisualChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :indivisual_checks do |t|

      t.timestamps
    end
  end
end
