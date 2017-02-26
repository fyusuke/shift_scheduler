class ChangeLineIdToLines < ActiveRecord::Migration[5.0]
  def change
    remove_column :lines, :line_id
    add_column :lines, :line_token, :string
  end
end
