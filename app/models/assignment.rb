class Assignment < ActiveRecord::Base
  #acts_as_paranoid
  belongs_to :pathway
  belongs_to :user
  has_many :assignments_steps, :dependent => :destroy
  has_many :steps, :through => :assignments_steps
  #validates_uniqueness_of :pathway_id , :scope => [:user_id]
end
