class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.integer :work_id
      t.string :ymd
      t.string :time
      t.integer :status
      t.integer :default?
      t.integer :work_or_rest?

      t.timestamps
    end
  end
end
