class CreatePathways < ActiveRecord::Migration
  def change
    create_table :pathways do |t|
      t.string :title, null: false
      t.boolean :active, :default => true
      t.text :memo

      t.timestamps null: false
    end
  end
end
