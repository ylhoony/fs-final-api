class AddLikecountToProductCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :likecount, :integer, default: 0
  end
end
