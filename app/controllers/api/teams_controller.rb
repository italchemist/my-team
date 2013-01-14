class Api::TeamsController < ApplicationController
  respond_to :json

  def index
    respond_with Team.all
  end

  def show
  	respond_with Team.find(params[:team_id])
  end

  def create
    respond_with Team.create(params[:team].slice(:name, :description))
  end

  def update
    respond_with Team.update(params[:team_id], params[:team].slice(:name, :description))
  end

  def destroy
    respond_with Team.destroy(params[:team_id])
  end

  def team_url(team)
    "/teams/#{team.id}"
  end
end