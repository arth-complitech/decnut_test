class Group < ActiveRecord::Base
	has_many :departments, :dependent => :destroy
	has_many :pathways, :dependent => :destroy
end
