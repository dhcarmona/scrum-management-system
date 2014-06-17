class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :projects
  has_many :owners
  has_many :masters
  has_many :products_owned, :through => :owners, :source => :project
  has_many :projects_managed, :through => :masters, :source => :project
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
