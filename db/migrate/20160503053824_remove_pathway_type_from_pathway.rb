class RemovePathwayTypeFromPathway < ActiveRecord::Migration
  def change
    remove_column :pathways, :pathway_type, :string
  end
end
