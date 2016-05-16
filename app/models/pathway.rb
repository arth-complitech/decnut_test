class Pathway < ActiveRecord::Base
	has_many :pathways_steps,:dependent => :destroy
	has_many :steps, :through => :pathways_steps ,:dependent => :destroy 
	accepts_nested_attributes_for :steps, :allow_destroy => true
	#accepts_nested_attributes_for :pathways_steps, :allow_destroy => true

	has_many :assignments, :dependent => :destroy
	#belongs_to :user
	belongs_to :group	

	#validation
  	validates :title, presence:true

  	#scope
  	scope :pathways_from_same_group, -> (user) { where('group_id in (?)', user.department.group.pathways.pluck(:id))}

  def get_max_display_order
  	self.pathways_steps.maximum(:display_order)
  end 
end
