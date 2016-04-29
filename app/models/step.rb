class Step < ActiveRecord::Base
  belongs_to :pathway
  has_many :assignments_steps
end
