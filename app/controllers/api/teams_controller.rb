class Api::TeamsController < ApplicationController
  respond_to :json

  def index
    render json: Team.all.map { |t| to_json(t) }
  end

  def show
  	render json: to_json(Team.find_by_id(id))
  end

  def create
    #todo: 32
    render json: to_json(Team.create(data))
  end

  def update
    #todo: 31
    render json: to_json(Team.update(id, data))
  end

  def destroy
    #todo: #30
    respond_with Team.destroy(id)
  end

  def team_url(team)
    "/teams/#{team.id}"
  end

  def to_json(t)
    { id: t.id, name: t.name, description: t.description }
  end

  def id
    params[:id]
  end

  def data
    params[:team].slice(:name, :description)
  end
end