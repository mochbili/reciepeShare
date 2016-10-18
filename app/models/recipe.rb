class Recipe < ActiveRecord::Base

  # relationship
  belongs_to :chef, dependent: :destroy

  # validation
  validates :name, presence: true,
                   length: {within: 5..50}
  validates :summary, presence: true,
                      length: {within: 10..150}
  validates :description, presence: true,
                          length: {minimum: 20}
  validates :chef_id, presence: true
  validate :picture_size

  # carrierWave
  mount_uploader :picture, PictureUploader

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5mb")
      end
    end
end
