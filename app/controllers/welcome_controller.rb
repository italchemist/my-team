class WelcomeController < ApplicationController
  def index
    #if params[:id]
    #  @teams = Team.where(:id => params[:id]).all
    #else
    @teams = Team.all
    #end

    if params[:team_id]
      @tasks = Task.where(:team_id => params[:team_id]).all
      if params[:task_id]
        task = @tasks.detect{ |t| t.id.to_s == params[:task_id] }
        @comments = task.comments.all
      end
    end

    @team_id = params[:team_id]
    ##@comments = params[:task_id]
  end
end
