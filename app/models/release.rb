class Release < ActiveRecord::Base
	belongs_to :project
	has_many :sprints, :dependent => :destroy
end
