class ChangeLineId2ToLines < ActiveRecord::Migration[5.0]
  def change
    add_index :lines, :line_token, unique: true
  end
end
