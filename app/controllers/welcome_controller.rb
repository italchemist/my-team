class WelcomeController < ApplicationController
  def index
    #if params[:id]
    #  @teams = Team.where(:id => params[:id]).all
    #else
    @teams = Team.all
    #end

    if params[:team_id]
      @tasks = Task.where(:team_id => params[:team_id]).all
    end

    @team_id = params[:team_id]
  end
end
