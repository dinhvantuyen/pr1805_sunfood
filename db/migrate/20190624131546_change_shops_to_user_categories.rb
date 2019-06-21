class ChangeShopsToUserCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :shops, :user_categories
  end
end
