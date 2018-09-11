class YoutubesController < ApplicationController

  def index
    # authorized
    
    youtubes = Youtube.all
    render json: youtubes
  end

  def create
    authorized
    youtube = Youtube.create(user_id: params[:teacher_id], title: params[:title], description: params[:description], link: params[:link])
    render json: Youtube.all
  end

  def destroy
    authorized
    Youtube.destroy(params[:id])
    render json: Youtube.all
  end

  private

  def resource_params
    params.permit(:user_id, :title, :description, :link)
  end

end
