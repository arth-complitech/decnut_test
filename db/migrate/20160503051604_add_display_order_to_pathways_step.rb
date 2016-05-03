class AddDisplayOrderToPathwaysStep < ActiveRecord::Migration
  def change
    add_column :pathways_steps, :display_order, :integer
  end
end
