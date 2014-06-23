class Sprint < ActiveRecord::Base
	belongs_to :release
	has_many :user_stories, :dependent => :destroy

 def identification_for_select
 	"Sprint #"+id.to_s+" of Release #"+ release.id.to_s
 end

 def total_stimated_hours_of_work
 	total_hours = 0
 	self.user_stories.each do |story|
 		story.user_story_tasks.each do |task|
 			total_hours += task.stimated_effort_in_hours
 		end
 	end
 	return total_hours
 end

  def total_stimated_points
 	total_points = 0
 	self.user_stories.each do |story|
 		total_points += story.points
 	end
 	return total_points
 end

end
