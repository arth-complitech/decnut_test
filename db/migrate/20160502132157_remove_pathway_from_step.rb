class RemovePathwayFromStep < ActiveRecord::Migration
  def change
    remove_reference :steps, :pathway, index: true, foreign_key: true
  end
end
