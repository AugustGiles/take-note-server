class AssignmentsController < ApplicationController

  def index
    assignments = Assignment.all
    render json: assignments
  end

  def update_current_practice_time
    data_sent = ActiveSupport::JSON.decode(request.body.read)
    assignment = Assignment.find(params[:id])
    value = assignment["current_practice_time"] + data_sent["current_practice_time"]

    assignment.update(current_practice_time: value)

    user = User.find(assignment["student_id"])
    render json: user
  end

end
