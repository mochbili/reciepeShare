class Recipe < ActiveRecord::Base

  # relationship
  belongs_to :chef, dependent: :destroy
  has_many :likes

  # validation
  validates :name, presence: true,
                   length: {within: 5..50}
  validates :summary, presence: true,
                      length: {within: 10..150}
  validates :description, presence: true,
                          length: {minimum: 20}
  validates :chef_id, presence: true

  validates :picture, presence: true

  validate :picture_size

  # carrierWave
  mount_uploader :picture, PictureUploader

  # like / dislike total
  def total_like
    self.likes.where(like: true).size
  end

  def total_dislike
    self.likes.where(like: false).size
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5mb")
      end
    end
end
