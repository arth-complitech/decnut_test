class CreateAssignmentsSteps < ActiveRecord::Migration
  def change
    create_table :assignments_steps do |t|
      t.references :assignment, index: true, foreign_key: true
      t.references :step, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
