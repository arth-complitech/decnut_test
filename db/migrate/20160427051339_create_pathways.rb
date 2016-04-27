class CreatePathways < ActiveRecord::Migration
  def change
    create_table :pathways do |t|
      t.string :title
      t.boolean :active
      t.text :memo

      t.timestamps null: false
    end
  end
end
