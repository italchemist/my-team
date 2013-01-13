class Task < ActiveRecord::Base
  belongs_to :team
  attr_accessible :description, :title, :closed
end
