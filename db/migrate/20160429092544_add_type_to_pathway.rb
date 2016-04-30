class AddTypeToPathway < ActiveRecord::Migration
  def change
    add_column :pathways, :pathway_type, :string
  end
end
