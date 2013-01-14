class Api::TaskCommentsController < ApplicationController
  respond_to :json

  def index
    respond_with Task.where(:id => params[:task_id]).first.comments.all
  end

  def show  	
  end

  def create
    respond_with Task.where(:id => params[:task_id]).first.comments.create(params[:comment].slice(:title, :comment))
  end

  def update    
  end

  def destroy    
  end

  def comment_url(comment)
    ""
    #"/api/tasks/#{task.team_id}/#{task.id}"
  end
end