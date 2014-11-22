class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :description, null: false
    	t.references :parent
    	t.references :entry
    	t.references :user
    	t.timestamps
    end
  end
end
