class Assignment < ActiveRecord::Base
  belongs_to :pathway
  belongs_to :user
end
