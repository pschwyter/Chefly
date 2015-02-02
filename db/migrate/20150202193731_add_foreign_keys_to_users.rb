class AddForeignKeysToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ingredient_id, :integer
  end
end
