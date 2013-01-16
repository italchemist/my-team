class Task < ActiveRecord::Base
  belongs_to :team
  acts_as_commentable
  attr_accessible :description, :title, :closed, :team_id
end
