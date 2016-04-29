class Assignment < ActiveRecord::Base
  belongs_to :pathway
  belongs_to :user
  has_many :assignments_steps
end
