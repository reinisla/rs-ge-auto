class AddAdditionalFieldsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_id, :integer
    add_column :items, :sp, :integer
    add_column :items, :buy_average, :integer
    add_column :items, :buy_quantity, :integer
    add_column :items, :sell_average, :integer
    add_column :items, :sell_quantity, :integer
    add_column :items, :overall_average, :integer
    add_column :items, :overall_quantity, :integer
    add_column :items, :current_change, :string
    add_column :items, :today_change, :string
    add_column :items, :day30_change, :string
    add_column :items, :day90_change, :string
    add_column :items, :day180_change, :string
    add_column :items, :icon, :text
  end
end
