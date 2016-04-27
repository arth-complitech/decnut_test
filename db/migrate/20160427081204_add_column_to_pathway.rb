class AddColumnToPathway < ActiveRecord::Migration
  def change
    add_reference :pathways, :user, index: true, foreign_key: true
  end
end
