class AssignmentsController < ApplicationController

  def index
    # authorized
    assignments = Assignment.all
    render json: assignments
  end

  def show
    authorized
    assignment = Assignment.find(params[:id])
    render json: assignment
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

    assignment = Assignment.create(teacher_id: params[:teacher_id], student_id: params[:student_id], assignment_text: params[:assignment_text], practice_goal: params[:practice_goal])

    params[:resources].each do |resource|
      assignment.resources << Resource.find(resource['id'])
    end
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
    params.permit(:teacher_id, :student_id, :assignment_text, :practice_goal, :current_practice_time, recordings: [], resources: [])
  end

end
