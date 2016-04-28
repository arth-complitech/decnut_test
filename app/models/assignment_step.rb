class AssignmentStep < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :step
end
