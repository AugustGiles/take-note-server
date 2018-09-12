class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :student_id, :assignment_text, :practice_goal, :current_practice_time, :created_at, :recordings
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  # has_many :assignment_resources
  has_many :resources, through: :assignment_resources
  # has_many :assignment_youtubes
  has_many :youtubes, through: :assignment_youtubes

  def recordings
    object.recordings.map { |recording|
      Rails.application.routes.url_helpers.rails_blob_path(recording, only_path: true)
    }
  end

end
