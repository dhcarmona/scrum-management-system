class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :projects
  has_many :projects_owned, :class_name => "Project", :foreign_key =>"product_owner_id"
  has_many :projects_managed, :class_name => "Project", :foreign_key =>"scrum_master_id"
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
