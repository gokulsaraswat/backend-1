class AddColumnDiscord < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :username, :string, default: "", null: false
  	add_column :users, :buddy, :integer, default: 0, null: true
  	add_column :users, :discord_id, :string, default: "", null: false
  	add_column :users, :active, :boolean
  	add_column :users, :role, :integer, default: [].to_yaml
  end
end
