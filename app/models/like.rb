class Like < ActiveRecord::Base

  # relationship
  belongs_to :chef, dependent: :destroy
  belongs_to :recipe, dependent: :destroy

  # validation
  validates_uniqueness_of :chef_id, scope: :recipe_id

end
