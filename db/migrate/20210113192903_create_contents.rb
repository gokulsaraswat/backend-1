class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
    	t.string :unique_id
    	t.string :parent_id
    	t.string :name
    	t.integer :data_type
    	t.string :link
      t.integer :priority
    	t.string :extra_link1
      t.string :extra_link2
      t.timestamps
    end
    add_index :contents, :parent_id
    add_index :contents, :unique_id
  end
end
