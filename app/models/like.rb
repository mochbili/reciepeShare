class Like < ActiveRecord::Base

  # relationship
  belongs_to :chef
  belongs_to :recipe

  # counter
  counter_culture :recipe

  # validation
  validates_uniqueness_of :chef_id, scope: :recipe_id

end
