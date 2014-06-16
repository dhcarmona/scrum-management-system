class Sprint < ActiveRecord::Base
	belongs_to :release
	has_many :user_stories, :dependent => :destroy
end
