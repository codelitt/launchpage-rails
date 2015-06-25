class AddTypeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :usertype, :integer
  	add_index :users, :usertype
  end
end
