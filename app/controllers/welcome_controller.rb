class WelcomeController < ApplicationController
  def index
    #if params[:id]
    #  @teams = Team.where(:id => params[:id]).all
    #else
    @teams = Team.all
    #end

    if params[:team_id]
      tasks = Task.where(:team_id => params[:team_id])
      @tasks = tasks.map { |t| 
        { id: t.id, title: t.title, description: t.description, closed: t.closed } 
      }
      @vacancies = Vacancy.where(:team_id => params[:team_id]).map { |v| 
        { id: v.id, title: v.title, description: v.description } 
      }

      if params[:task_id]
        task = tasks.detect { |t| t.id.to_s == params[:task_id] }
        @comments = task.comments.all if task
      end
    end

    @team_id = params[:team_id]
    @task_id = params[:task_id]
    @user = current_user
  end
end
