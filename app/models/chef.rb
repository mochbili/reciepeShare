class Chef < ActiveRecord::Base

  # relationship
  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy

  # callback
  before_save :change_email_downcase

  # validation
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :chefname, presence: true,
                       length: {within: 3..40}
  validates :email, presence: true,
                    length: {within: 10..50},
                    uniqueness: {case_sensitive: false},
                    format: EMAIL_REGEX

  has_secure_password

  private

    def change_email_downcase
      self.email = email.downcase
    end
end
