class Resource < ApplicationRecord
  belongs_to :user
  has_many :assignment_resources
  has_many :assignments, through: :assignment_resources
  has_one_attached :file
end
