class RenameReciepeToRecipe < ActiveRecord::Migration

  def change
    rename_table :reciepes, :recipes
  end
end
