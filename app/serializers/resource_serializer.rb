class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :youtube
  belongs_to :user
  has_many :assignment_resources
  has_many :assignments, through: :assignment_resources

  def file
    if object.youtube == nil
      Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
    else
      ''
    end
  end

end
