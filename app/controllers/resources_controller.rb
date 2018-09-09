class ResourcesController < ApplicationController

  def index
    # authorized
    resources = Resource.all
    render json: resources
  end

  def create
    authorized
    debugger
  end

end
