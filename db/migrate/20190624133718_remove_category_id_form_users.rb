class RemoveCategoryIdFormUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :category_id
  end
end
