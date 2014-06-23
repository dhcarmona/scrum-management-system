class UserStory < ActiveRecord::Base
	belongs_to :user
	belongs_to :sprint
	belongs_to :project, :dependent => :destroy
	has_many :success_criterions
	has_many :user_story_tasks
	has_many :added_times, :through => :user_story_tasks
end
