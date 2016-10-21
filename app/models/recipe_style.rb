class RecipeStyle < ActiveRecord::Base

  # relationship
  belongs_to :recipe
  belongs_to :style
end
