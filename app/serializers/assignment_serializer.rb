class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :student_id, :assignment_text, :practice_goal, :current_practice_time
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :student, class_name: "User", foreign_key: "student_id"
end
