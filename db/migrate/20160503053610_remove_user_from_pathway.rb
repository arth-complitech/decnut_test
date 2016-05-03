class RemoveUserFromPathway < ActiveRecord::Migration
  def change
    remove_reference :pathways, :user, index: true, foreign_key: true
  end
end
