class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.references :pathway, index: true, foreign_key: true
      t.string :title, null: false
      t.string :subtitle
      t.text :body
      t.integer :parent_step_id
      t.string :url_link
      t.boolean :active, :default => true
      t.text :memo

      t.timestamps null: false
    end
  end
end
