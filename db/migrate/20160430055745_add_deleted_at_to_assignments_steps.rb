class AddDeletedAtToAssignmentsSteps < ActiveRecord::Migration
  def change
    add_column :assignments_steps, :deleted_at, :datetime
    add_index :assignments_steps, :deleted_at
  end
end
