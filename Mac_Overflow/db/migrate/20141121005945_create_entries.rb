class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.string :title
    	t.string :content
    	t.references :parent
    	t.references :user
    	t.timestamps
    end
  end
end
