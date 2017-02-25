class ChangeColumnToUsers< ActiveRecord::Migration

  # 変更内容
  def up
    change_column_default :users, :fake? ,false
  end

  # 変更前の状態
  def down
    change_column_default :users, :fake?, :boolean, nil
  end
end