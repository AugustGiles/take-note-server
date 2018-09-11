class Assignment < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  has_many_attached :recordings
  has_many :assignment_resources
  has_many :resources, through: :assignment_resources
  has_many :assignment_youtubes
  has_many :youtubes, through: :assignment_youtubes
end
