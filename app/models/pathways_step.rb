class PathwaysStep < ActiveRecord::Base
  belongs_to :pathway
  belongs_to :step
end
