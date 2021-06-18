class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
    	#t.string :discord_id
    	t.integer :user_id
    	t.integer :content_id
    	t.integer :status

      t.timestamps
    end
    add_index :submissions, [:user_id, :content_id], unique: true
  end
end
