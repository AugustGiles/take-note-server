class ResourcesSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :title, :resource
  belongs_to :user

  def resource
    object.resource
  end

end
