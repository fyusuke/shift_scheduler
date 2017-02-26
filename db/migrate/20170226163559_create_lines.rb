class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer :line_id
      t.integer :conv_state
      t.string :answers

      t.timestamps
    end
  end
end
