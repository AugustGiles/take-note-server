class ResourcesController < ApplicationController

  def index
    # authorized
    resources = Resource.all
    render json: resources
  end

  def create
    authorized
    resource = Resource.create(user_id: params[:teacher_id], title: params[:title], description: params[:description], file: params[:file])
    # resources = Resource.all.select {|resource| resource[:teacher_id] == params[:teacher_id]}
    render json: Resource.all
  end

  def destroy
    authorized
    Resource.destroy(params[:id])
    render json: Resource.all
  end

  private

  def resource_params
    params.permit(:user_id, :title, :description, :file)
  end

end
