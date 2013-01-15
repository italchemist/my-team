class Api::TeamsController < ApplicationController
  respond_to :json

  def index
    render json: Team.all.map { |t| to_json(t) }
  end

  def show
  	render json: Team.find(params[:team_id]).map { |t| to_json(t) }
  end

  def create
    render json: to_json(Team.create(params[:team]))
  end

  def update
    respond_with Team.update(params[:id], params[:team].slice(:name, :description))
  end

  def destroy
    respond_with Team.destroy(params[:id])
  end

  def team_url(team)
    "/teams/#{team.id}"
  end

  def to_json(t)
    { id: t.id, name: t.name, description: t.description }
  end
end