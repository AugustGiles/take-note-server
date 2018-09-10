class ResourcesController < ApplicationController

  def index
    # authorized
    resources = Resource.all
    render json: resources
  end

  def create
    authorized
    resource = Resource.create(user_id: params[:teacher_id], title: params[:title], description: params[:description], file: params[:file])
    render json: resource
  end

  private

  def resource_params
    params.permit(:user_id, :title, :description, :file)
  end

end
