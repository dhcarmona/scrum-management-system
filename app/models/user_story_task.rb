class UserStoryTask < ActiveRecord::Base
	has_many :success_criterions, :dependent => :destroy
end
