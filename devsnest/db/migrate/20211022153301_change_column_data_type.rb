class ChangeColumnDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :challenges, :topic, :integer
  end
end
