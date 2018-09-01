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
    updated = Assignment.all[-1]
    render json: updated
  end

  def create
    authorized
    data_sent = ActiveSupport::JSON.decode(request.body.read)
    assignment = Assignment.create(data_sent)
    render json: assignment
  end

end
