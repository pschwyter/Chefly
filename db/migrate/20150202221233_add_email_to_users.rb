class AddEmailToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :email
  	add_column :users, :email, :string, :null => false, :default => ""
  end
end
