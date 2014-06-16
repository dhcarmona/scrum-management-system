class Risk < ActiveRecord::Base
	belongs_to :project
	has_one :responsible, :class_name => "User", :foreign_key => "responsible_id"
end
