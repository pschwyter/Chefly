class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|

      t.timestamps
    end
  end
end
