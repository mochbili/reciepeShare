class RecipeIngredient < ActiveRecord::Base

  # relationship
  belongs_to :recipe
  belongs_to :ingredient
end
