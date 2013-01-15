class Api::VacanciesController < ApplicationController
  respond_to :json

  def search
    passed_skills = params[:skills].split(",")
    
    render :json => Vacancy.joins(:skills)
      .where { skills.name.in(passed_skills) }
      .group { vacancies.id }
      .having {{ 
        vacancies => { count(id) => passed_skills.size }
      }}.all
  end

  def index
    # TODO
    # 1) all => find_each
    # 2) используй select
    # 3) includes(:skills)
    # Иначе дико просядет на реальной нагрузке
    respond_with Vacancy.where(:team_id => params[:team_id]).all.map { |v|
      { id: v.id, team_id: v.team_id, title: v.title, description: v.description, skills: v.skills.map { |s| s.name }}
    }
  end

  def show
    respond_with Vacancy.where(:team_id => params[:team_id]).find(params[:vacancy_id])
  end

  def create
    v = Vacancy.where(:team_id => params[:team_id]).create(params[:vacancy].slice(:title, :description))
    skills = params[:vacancy][:skills].each do |s|
      v.skills << Skill.find_or_create_by_name(s)
    end
    respond_with v
  end

  def update
    v = Vacancy.update(params[:vacancy][:id], params[:vacancy].slice(:title, :description))
    v.skills.delete_all
    skills = params[:vacancy][:skills].each do |s|
      v.skills << Skill.find_or_create_by_name(s)
    end
    respond_with v
  end

  def destroy
    respond_with Vacancy.where(:team_id => params[:team_id]).destroy(params[:id])
  end

  def vacancy_url(vacancy)
    ""
  end
end