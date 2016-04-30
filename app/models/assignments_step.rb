class AssignmentsStep < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :assignment
  belongs_to :step
end
