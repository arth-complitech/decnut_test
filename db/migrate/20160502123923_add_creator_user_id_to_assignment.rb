class AddCreatorUserIdToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :creator_user_id, :integer
  end
end
