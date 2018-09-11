class ResourcesController < ApplicationController

  def index
    # authorized
    resources = Resource.all
    render json: resources
  end

  def create
    authorized
    resource = Resource.create(user_id: params[:teacher_id], title: params[:title], description: params[:description], youtube: params[:youtube], file: params[:file])
    render json: Resource.all
  end

  def destroy
    authorized
    Resource.destroy(params[:id])
    render json: Resource.all
  end

  private

  def resource_params
    params.permit(:user_id, :title, :description, :youtube, :file)
  end

end
