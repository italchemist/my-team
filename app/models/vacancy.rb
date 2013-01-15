class Vacancy < ActiveRecord::Base
  belongs_to :team
  has_many :vacancy_skills
  has_many :skills, :through => :vacancy_skills
  attr_accessible :description, :title
end
