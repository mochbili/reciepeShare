class Style < ActiveRecord::Base

  # relationship
  has_many :recipe_styles
  has_many :recipes, through: :recipe_styles

  # validation
  validates :name, presence: true,
                   length: { minimum: 2, maximum: 25 }
end
