class Department < ActiveRecord::Base
  ## Associations
  belongs_to :group
  has_many :users

  ## Scopes
  scope :data_from_same_group, ->(id) { where('group_id = ?', id) }
end
