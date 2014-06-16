class Project < ActiveRecord::Base
	has_many :releases, :dependent => :destroy
	has_many :user_stories, :dependent => :destroy
	
	has_many :stakeholders, :dependent => :destroy
	has_many :risks, :dependent => :destroy
	belongs_to :product_owner, :class_name => "User", :foreign_key =>"product_owner_id"
	belongs_to :scrum_master, :class_name => "User", :foreign_key =>"scrum_master_id"
	has_and_belongs_to_many :users
end
