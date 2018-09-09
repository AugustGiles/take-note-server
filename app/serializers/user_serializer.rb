class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :students, class_name: "User", foreign_key: "teacher_id"
  belongs_to :teacher, class_name: "User", optional: true

  has_many :givenAssignments, class_name: "Assignment", foreign_key: "student_id"
  has_many :assignments, foreign_key: "teacher_id"

  has_many :resources

end
