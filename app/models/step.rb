class Step < ActiveRecord::Base
  belongs_to :pathway
  has_many :assignments_steps, :dependent => :destroy
  has_many :assignments, :through => :assignments_steps
end
