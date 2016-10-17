class Reciepe < ActiveRecord::Base

  # validation
  validates :name, presence: true,
                   length: {within: 5..50}
  validates :summary, presence: true,
                      length: {within: 10..150}
  validates :description, presence: true,
                          length: {minimum: 20}
end
