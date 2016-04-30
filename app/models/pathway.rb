class Pathway < ActiveRecord::Base
	has_many :steps, :dependent => :destroy
	accepts_nested_attributes_for :steps, :allow_destroy => true
	has_many :assignments, :dependent => :destroy
	belongs_to :user	
end
