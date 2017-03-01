class ChangeColumns2ToShifts < ActiveRecord::Migration[5.0]
  def change
    remove_column :shifts, :ymd, :string
    remove_column :shifts, :time, :string
    remove_column :workers, :first_day, :string
    add_column :shifts, :start_datetime, :datetime
    add_column :shifts, :end_datetime, :datetime
    add_column :shifts, :rest_min, :integer
    add_column :workers, :first_datetime, :datetime
  end
end
