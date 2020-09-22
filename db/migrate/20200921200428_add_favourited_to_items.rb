class AddFavouritedToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :favourited, :boolean, default: false
  end
end
