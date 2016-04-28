class Pathway < ActiveRecord::Base
	has_many :steps
	has_many :assignments
	belongs_to :user	
end