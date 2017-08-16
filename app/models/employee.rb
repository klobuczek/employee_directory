class Employee < ApplicationRecord
  has_many :positions
  validates :first_name, presence: true

  has_one_attached :profile_photo
end
