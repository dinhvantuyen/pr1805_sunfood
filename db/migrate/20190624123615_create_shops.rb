class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :product_id
      t.string :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
