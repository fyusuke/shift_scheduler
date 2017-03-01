class ChangeResetMinToShifts < ActiveRecord::Migration[5.0]
  def change
    rename_column :shifts, :rest_min, :rest_sec
  end
end
