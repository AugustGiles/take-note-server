class RecordingsController < ApplicationController

  def index
    authorized
    recordings = Recording.all
    render json: recordings
  end

  def create
    authorized
    debugger
    recording = Recording.create(data_sent)
    
  end

end
