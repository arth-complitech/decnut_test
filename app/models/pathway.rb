class Pathway < ActiveRecord::Base
	has_many :pathways_steps,:dependent => :destroy
	has_many :steps, :through => :pathways_steps ,:dependent => :destroy 
	accepts_nested_attributes_for :steps, :allow_destroy => true

	has_many :assignments, :dependent => :destroy
	#belongs_to :user
	belongs_to :group	

end
