class Project < ActiveRecord::Base
	has_many :releases, :dependent => :destroy
	has_many :sprints, :through => :releases
	has_many :user_stories, :dependent => :destroy
	has_many :owners
	has_many :masters
	has_many :stakeholders, :dependent => :destroy
	has_many :risks, :dependent => :destroy
	has_many :product_owners, :through => :owners, :source => :user
	has_many :scrum_masters, :through => :masters, :source => :user
	has_and_belongs_to_many :users
end
