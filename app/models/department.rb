class Department < ActiveRecord::Base
  ## Associations
  belongs_to :group
  has_many :users, :dependent => :destroy

  ## Scopes
  scope :data_from_same_group, ->(id) { where('group_id = ?', id) }

  #validation
  validates :name, presence:true
end
