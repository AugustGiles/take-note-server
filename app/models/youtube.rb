class Youtube < ApplicationRecord
  belongs_to :user
  has_many :assignment_youtubes
  has_many :assignments, through: :assignment_youtubes
end
