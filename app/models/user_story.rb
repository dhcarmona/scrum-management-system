class UserStory < ActiveRecord::Base
	belongs_to :user
	belongs_to :sprint
	belongs_to :project
	

end
