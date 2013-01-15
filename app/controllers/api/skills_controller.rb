class Api::SkillsController < ApplicationController
  respond_to :json

  def index
    q = params[:q]
    respond_with Skill.where("name like ?", "%#{q}%").all.map{ |s| s.name }
  end

  def create
    respond_with Skill.create(params[:skill].slice(:name))
  end

  def update
    respond_with Skill.update(params[:team_id], params[:team].slice(:name, :description))
  end

  def destroy
    respond_with Skill.destroy(params[:team_id])
  end

  def skill_url(skill)
    "/api/skills/#{skill.id}"
  end
end