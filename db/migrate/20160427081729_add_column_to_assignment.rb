class AddColumnToAssignment < ActiveRecord::Migration
  def change
    add_reference :assignments, :user, index: true, foreign_key: true
  end
end
