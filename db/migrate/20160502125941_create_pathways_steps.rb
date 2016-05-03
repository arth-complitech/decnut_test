class CreatePathwaysSteps < ActiveRecord::Migration
  def change
    create_table :pathways_steps do |t|
      t.references :pathway, index: true, foreign_key: true
      t.references :step, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
