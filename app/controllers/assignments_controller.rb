class AssignmentsController < ApplicationController

  def index
    # authorized
    assignments = Assignment.all
    render json: assignments
  end

  def update_current_practice_time
    authorized
    data_sent = ActiveSupport::JSON.decode(request.body.read)
    assignment = Assignment.find(params[:id])
    value = assignment["current_practice_time"] + data_sent["current_practice_time"]
    assignment.update(current_practice_time: value)
    # updated = assignment
    render json: assignment
  end

  def create
    authorized
    data_sent = ActiveSupport::JSON.decode(request.body.read)
    assignment = Assignment.create(data_sent)
    render json: assignment
  end

  def attach_recording
    authorized

    assignment = Assignment.find(params[:id])
    # Rails.application.routes.url_helpers.rails_blob_url(Assignment.find(3).recordings.first, only_path: true)
    r = assignment.recordings.attach(params[:recording])
    puts "r is #{r}"
    url = Rails.application.routes.url_helpers.rails_blob_url(r.first, only_path: true)
    render json: {message: "Attached to File", url: url}
  end

  private

  def assignment_params
    params.permit(:teacher_id, :student_id, :assignment_text, :practice_goal, :current_practice_time, recordings: [])
  end

end
