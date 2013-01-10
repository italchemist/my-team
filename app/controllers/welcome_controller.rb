class WelcomeController < ApplicationController
  def index
    #if params[:id]
    #  @teams = Team.where(:id => params[:id]).all
    #else
    @teams = Team.all
    #end
  end
end
