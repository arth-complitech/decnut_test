class Group < ActiveRecord::Base
	has_many :departments, :dependent => :destroy
	has_many :pathways, :dependent => :destroy
	#validation
  validates :name, presence:true
  validates_uniqueness_of :registration_code, message: "This code has already been taken."
end
