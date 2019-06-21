class RemoveProductIdFormUserCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_categories, :product_id
  end
end
