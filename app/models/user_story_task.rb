class UserStoryTask < ActiveRecord::Base
	belongs_to :user_story
	has_many :added_times, :dependent => :destroy

	def GetTotalWorkedHours
		total_hours = 0
		added_times.each do |time|
			total_hours += time.hours
		end
		return total_hours
	end
end

