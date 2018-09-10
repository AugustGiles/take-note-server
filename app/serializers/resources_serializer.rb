class ResourcesSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :title, :file
  belongs_to :assignment

  def file
    object.file
  end

end
