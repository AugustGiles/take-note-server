class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :file
  belongs_to :user

  def file
    Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
  end

end
