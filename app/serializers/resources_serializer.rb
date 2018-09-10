class ResourcesSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :title, :file
  belongs_to :assignment

  def file
    Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
  end

end
