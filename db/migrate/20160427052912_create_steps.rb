class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :pathway, index: true, foreign_key: true
      t.string :title
      t.string :subtitle
      t.text :body
      t.integer :child_step
      t.integer :parent_step
      t.string :url_link
      t.boolean :active
      t.text :memo

      t.timestamps null: false
    end
  end
end
