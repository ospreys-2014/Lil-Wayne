class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.string :title, null: false
    	t.string :content, null: false
    	t.references :user
    	t.timestamps
    end
  end
end
