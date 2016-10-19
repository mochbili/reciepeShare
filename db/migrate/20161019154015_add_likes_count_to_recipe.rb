class AddLikesCountToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :likes_count, :integer, null: false, default: 0
  end
end
