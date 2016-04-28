class Step < ActiveRecord::Base
  belongs_to :pathway
  has_many :assignment_steps
end
