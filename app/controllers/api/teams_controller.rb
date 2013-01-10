class Api::TeamsController < ApplicationController
  respond_to :json

  def index
    respond_with Team.all
  end

  def show
  	respond_with Team.find(params[:id])
  end

  def create
    respond_with Team.create(params[:team].slice(:name))
  end

  def update
    respond_with Team.update(params[:id], params[:team].slice(:name))
  end

  def destroy
    respond_with Team.destroy(params[:id])
  end

  def team_url(team)
    "/teams/#{team.id}"
  end
end