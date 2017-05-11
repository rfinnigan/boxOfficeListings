class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :venues, :title, :name
  end
end
