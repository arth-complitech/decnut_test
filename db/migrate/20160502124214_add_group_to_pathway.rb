class AddGroupToPathway < ActiveRecord::Migration
  def change
    add_reference :pathways, :group, index: true, foreign_key: true
  end
end
