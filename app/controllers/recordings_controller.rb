class RecordingsRecorder < ApplicationController

  def index
    authorized
    recordings = Recording.all
    render json: recordings
  end

  def create
    authorized
    
    recording = Recording.create(data_sent)
    render json: recording
  end

end
