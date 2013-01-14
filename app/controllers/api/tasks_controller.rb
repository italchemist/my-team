class Api::TasksController < ApplicationController
  respond_to :json

  def index
    respond_with Task.where(:team_id => params[:team_id]).all
  end

  def show
  	respond_with Task.where(:team_id => params[:team_id]).find(params[:task_id])
  end

  def create
    respond_with Task.where(:team_id => params[:team_id]).create(params[:task].slice(:title, :description, :closed))
  end

  def update
    respond_with Task.where(:team_id => params[:team_id]).update(params[:task_id], params[:task].slice(:title, :description, :closed))
  end

  def destroy
    respond_with Task.where(:team_id => params[:team_id]).destroy(params[:task_id])
  end

  def task_url(task)
    "/tasks/#{task.team_id}/#{task.id}"
  end
end