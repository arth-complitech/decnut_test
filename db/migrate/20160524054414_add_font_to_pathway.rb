class AddFontToPathway < ActiveRecord::Migration
  def change
    add_column :pathways, :font, :string
  end
end
