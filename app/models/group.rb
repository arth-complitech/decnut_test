class Group < ActiveRecord::Base
	has_many :departments, :dependent => :destroy
	has_many :pathways, :dependent => :destroy
	has_many :users, :dependent => :destroy
	#validation
  	validates :name, presence:true
  	validates_uniqueness_of :registration_code, message: "This code has already been taken."

  	def generate_code
  		self.registration_code = rand(0000..9999).to_s.rjust(4, "0")
  		save
	end
end
