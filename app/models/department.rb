class Department < ActiveRecord::Base
  belongs_to :group
  has_many :users
end
