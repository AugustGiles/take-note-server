class YoutubeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :link
  belongs_to :user
  has_many :assignments, through: :assignment_youtubes

end
